require "json"

def Object.from_json(any : JSON::Any)
  new(any)
end

module JSON
  module Serializable
    macro included
      def self.new(any : ::JSON::Any)
        new_from_json_any(any)
      end

      private def self.new_from_json_any(any : ::JSON::Any)
        instance = allocate
        instance.initialize(any)
        GC.add_finalizer(instance) if instance.responds_to?(:finalize)
        instance
      end

      macro inherited
        def self.new(any : ::JSON::PullParser)
          new_from_json_any(any)
        end
      end
    end

    def initialize(any : ::JSON::Any)
      hash = any.as_h?
      raise "Bad type, expecting a object, got #{any.raw.class.name}" unless hash

      {% begin %}
        {% properties = {} of Nil => Nil %}
        {% for ivar in @type.instance_vars %}
          {% ann = ivar.annotation(::JSON::Field) %}
          {% unless ann && (ann[:ignore] || ann[:ignore_deserialize]) %}
            {%
              properties[ivar.id] = {
                type:        ivar.type,
                key:         ((ann && ann[:key]) || ivar).id.stringify,
                has_default: ivar.has_default_value?,
                default:     ivar.default_value,
                nilable:     ivar.type.nilable?,
                root:        ann && ann[:root],
                converter:   ann && ann[:converter],
                presence:    ann && ann[:presence],
              }
            %}
          {% end %}
        {% end %}

        {% for name, value in properties %}
          %var{name} = hash[{{value[:key]}}]?
          @{{name}} = if %var{name}.nil?
                        {% if value[:has_default] %}
                          {{value[:default]}}
                        {% elsif value[:nilable] %}
                          nil
                        {% else %}
                          raise "Missing JSON attribute: {{value[:key].id}}."
                        {% end %}
                      else
                         {{ value[:type] }}.new(%var{name})
                      end
        {% end %}
      {% end %}
    end

    def self.from_json(any : JSON::Any)
      new(any)
    end
  end
end

def String.new(any : JSON::Any)
  any.as_s
end

def Path.new(any : JSON::Any)
  Path.new(any.as_s)
end

def Nil.new(any : JSON::Any)
  any.as_nil
end

def Bool.new(any : JSON::Any)
  any.as_bool
end

def Int32.new(any : JSON::Any)
  any.as_i
end

def Int64.new(any : JSON::Any)
  any.as_i64
end

{% for type, method in {
                         "Int8"   => "i8",
                         "Int16"  => "i16",
                         "UInt8"  => "u8",
                         "UInt16" => "u16",
                         "UInt32" => "u32",
                         "UInt64" => "u64",
                       } %}
  def {{type.id}}.new(any : JSON::Any)
    any.as_i64.to_{{method.id}}
  end
{% end %}

def Float32.new(any : JSON::Any)
  any.as_f32? || any.as_i.to_f32
end

def Float64.new(any : JSON::Any)
  any.as_f? || any.as_i.to_f64
end

def Enum.new(any : JSON::Any)
  value = any.raw
  case value
  when Int64
    from_value(value)
  when String
    parse(value)
  else
    raise "Expecting int or string in JSON for #{self.class}, not #{value.class.name}"
  end
end

def Array.new(any : JSON::Any)
  any.as_a.map do |elem|
    T.new(elem)
  end
end

def Array.from_json(any : JSON::Any) : Nil
  any.as_a.each do |elem|
    yield T.new(elem)
  end
end

def Deque.new(any : JSON::Any)
  deque = new
  any.as_a.each do |elem|
    deque << T.new(elem)
  end
  deque
end

def Hash.new(any : JSON::Any)
  hash = new
  any.as_h.each do |key, value|
    {% if K == String %}
      hash[key] = V.new(value)
    {% else %}
      parsed_key = K.from_json_object_key?(key)
      raise "Can't convert #{key.inspect} into #{K}" unless parsed_key

      hash[parsed_key] = V.new(value)
    {% end %}
  end
  hash
end

def Union.new(any : JSON::Any) : self
  value = any.raw

  {% begin %}
  {% convertions = {Int8    => "i8",
                    Int16   => "i16",
                    Int32   => "i32",
                    Int64   => "i64",
                    UInt8   => "u8",
                    UInt16  => "u16",
                    UInt32  => "u32",
                    UInt64  => "u64",
                    Float32 => "f32",
                    Float64 => "f64"} %}
    case value
    {% if T.includes? Nil %}
    when Nil
      return nil
    {% end %}
    {% if T.includes? Bool %}
    when Bool
      return any.as_bool
    {% end %}
    {% if T.includes? String %}
    when String
      return any.as_s
    {% end %}
    when Int64
    {% type_order = [Int64, UInt64, Int32, UInt32, Int16, UInt16, Int8, UInt8, Float64, Float32] %}
    {% for type in type_order.select { |t| T.includes? t } %}
      return value.to_{{ convertions[type].id }}!
    {% end %}
    when Float64
    {% type_order = [Float64, Float32] %}
    {% for type in type_order.select { |t| T.includes? t } %}
      return value.to_{{ convertions[type].id }}!
    {% end %}
    when Array(JSON::Any)
      {% for type in T.select { |t| t <= Array } %}
        begin
          return {{type}}.new(any)
        rescue
          nil
        end
      {% end %}
    when Hash(String,JSON::Any)
    {% primitive_types = [Nil, Bool, String] + Number::Primitive.union_types %}
    {% non_primitives = T.reject { |t| primitive_types.includes? t } %}
    {% for type in non_primitives.select { |t| T.includes? t } %}
      begin
        return {{type}}.new(any)
      rescue
        nil
      end
    {% end %}
    end
  {% end %}
  raise "Bad type"
end

def NamedTuple.new(any : JSON::Any)
  hash = any.as_h
  {% begin %}
    {
      {% for key, type in T %}
        {% if type.nilable? %}
        {{key}}: hash.has_key?({{key.stringify}}) ? {{type}}.new(hash[{{key.stringify}}]) : nil,
        {% else %}
        {{key}}: {{type}}.new(hash[{{key.stringify}}]),
        {% end %}
      {% end %}
    }
  {% end %}
end

def Tuple.new(any : JSON::Any)
  {% begin %}
    array = any.as_a
    new(
      {% for i in 0...T.size %}
        (self[{{i}}].new(array[{{i}}])),
      {% end %}
    )
 {% end %}
end
