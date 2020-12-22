require "./spec_helper"

enum JSONSpecEnum
  Zero
  One
  Two
end

struct JSONSpecNonPrimitive
  include JSON::Serializable

  getter num : JSONSpecEnum
  getter str : String

  def initialize(@num : JSONSpecEnum, @str)
  end
end

describe "JSON.from_json(Any)" do
  it "does String.from_json" do
    String.from_json(JSON.parse(%("foo bar"))).should eq "foo bar"
  end

  it "does Path.from_json" do
    Path.from_json(JSON.parse(%("foo/bar"))).should eq(Path.new("foo/bar"))
  end

  it "does Array(Nil)#from_json" do
    Array(Nil).from_json(JSON.parse("[null, null]")).should eq([nil, nil])
  end

  it "does Array(Bool)#from_json" do
    Array(Bool).from_json(JSON.parse("[true, false]")).should eq([true, false])
  end

  it "does Array(Int32)#from_json" do
    Array(Int32).from_json(JSON.parse("[1, 2, 3]")).should eq([1, 2, 3])
  end

  it "does Array(Int64)#from_json" do
    Array(Int64).from_json(JSON.parse("[1, 2, 3]")).should eq([1, 2, 3])
  end

  it "does Array(Float32)#from_json" do
    Array(Float32).from_json(JSON.parse("[1.5, 2, 3.5]")).should eq([1.5, 2.0, 3.5])
  end

  it "does Array(Float64)#from_json" do
    Array(Float64).from_json(JSON.parse("[1.5, 2, 3.5]")).should eq([1.5, 2, 3.5])
  end

  it "does Deque(String)#from_json" do
    Deque(String).from_json(JSON.parse(%(["a", "b"]))).should eq(Deque.new(["a", "b"]))
  end

  it "does Hash(String, String)#from_json" do
    Hash(String, String).from_json(JSON.parse(%({"foo": "x", "bar": "y"}))).should eq({"foo" => "x", "bar" => "y"})
  end

  it "does Hash(String, Int32)#from_json" do
    Hash(String, Int32).from_json(JSON.parse(%({"foo": 1, "bar": 2}))).should eq({"foo" => 1, "bar" => 2})
  end

  it "does Hash(Int32, String)#from_json" do
    Hash(Int32, String).from_json(JSON.parse(%({"1": "x", "2": "y"}))).should eq({1 => "x", 2 => "y"})
  end

  it "does Hash(Float32, String)#from_json" do
    Hash(Float32, String).from_json(JSON.parse(%({"1.23": "x", "4.56": "y"}))).should eq({1.23_f32 => "x", 4.56_f32 => "y"})
  end

  it "does Hash(Float64, String)#from_json" do
    Hash(Float64, String).from_json(JSON.parse(%({"1.23": "x", "4.56": "y"}))).should eq({1.23 => "x", 4.56 => "y"})
  end

  #   it "does Hash(BigInt, String)#from_json" do
  #     Hash(BigInt, String).from_json(JSON.parse(%({"12345678901234567890": "x"})).should eq({"12345678901234567890".to_big_i => "x"}))
  #   end
  #
  #   it "does Hash(BigFloat, String)#from_json" do
  #     Hash(BigFloat, String).from_json(JSON.parse(%({"1234567890.123456789": "x"})).should eq({"1234567890.123456789".to_big_f => "x"}))
  #   end
  #
  #   it "does Hash(BigDecimal, String)#from_json" do
  #     Hash(BigDecimal, String).from_json(JSON.parse(%({"1234567890.123456789": "x"})).should eq({"1234567890.123456789".to_big_d => "x"}))
  #   end
  #
  it "raises an error Hash(String, Int32)#from_json with null value" do
    expect_raises(TypeCastError) do
      Hash(String, Int32).from_json(JSON.parse(%({"foo": 1, "bar": 2, "baz": null})))
    end
  end

  it "does for Array(Int32) with block" do
    elements = [] of Int32
    ret = Array(Int32).from_json(JSON.parse("[1, 2, 3]")) do |element|
      elements << element
    end
    ret.should be_nil
    elements.should eq([1, 2, 3])
  end

  it "does for tuple" do
    tuple = Tuple(Int32, String).from_json(JSON.parse(%([1, "hello"])))
    tuple.should eq({1, "hello"})
    tuple.should be_a(Tuple(Int32, String))
  end

  it "does for named tuple" do
    tuple = NamedTuple(x: Int32, y: String).from_json(JSON.parse(%({"y": "hello", "x": 1})))
    tuple.should eq({x: 1, y: "hello"})
    tuple.should be_a(NamedTuple(x: Int32, y: String))
  end

  it "does for named tuple with nilable fields (#8089)" do
    tuple = NamedTuple(x: Int32?, y: String).from_json(JSON.parse(%({"y": "hello"})))
    tuple.should eq({x: nil, y: "hello"})
    tuple.should be_a(NamedTuple(x: Int32?, y: String))
  end

  it "does for named tuple with nilable fields and null (#8089)" do
    tuple = NamedTuple(x: Int32?, y: String).from_json(JSON.parse(%({"y": "hello", "x": null})))
    tuple.should eq({x: nil, y: "hello"})
    tuple.should be_a(NamedTuple(x: Int32?, y: String))
  end

  #   it "does for BigInt" do
  #     big = BigInt.from_json(JSON.parse("123456789123456789123456789123456789123456789"))
  #     big.should be_a(BigInt)
  #     big.should eq(BigInt.new("123456789123456789123456789123456789123456789"))
  #   end
  #
  #   it "does for BigFloat" do
  #     big = BigFloat.from_json(JSON.parse("1234.567891011121314"))
  #     big.should be_a(BigFloat)
  #     big.should eq(BigFloat.new("1234.567891011121314"))
  #   end
  #
  #   it "does for BigFloat from int" do
  #     big = BigFloat.from_json(JSON.parse("1234"))
  #     big.should be_a(BigFloat)
  #     big.should eq(BigFloat.new("1234"))
  #   end
  #
  #   it "does for UUID (hyphenated)" do
  #     uuid = UUID.from_json(JSON.parse("\"ee843b26-56d8-472b-b343-0b94ed9077ff\""))
  #     uuid.should be_a(UUID)
  #     uuid.should eq(UUID.new("ee843b26-56d8-472b-b343-0b94ed9077ff"))
  #   end
  #
  #   it "does for UUID (hex)" do
  #     uuid = UUID.from_json(JSON.parse("\"ee843b2656d8472bb3430b94ed9077ff\""))
  #     uuid.should be_a(UUID)
  #     uuid.should eq(UUID.new("ee843b26-56d8-472b-b343-0b94ed9077ff"))
  #   end
  #
  #   it "does for UUID (urn)" do
  #     uuid = UUID.from_json(JSON.parse("\"urn:uuid:ee843b26-56d8-472b-b343-0b94ed9077ff\""))
  #     uuid.should be_a(UUID)
  #     uuid.should eq(UUID.new("ee843b26-56d8-472b-b343-0b94ed9077ff"))
  #   end
  #
  #   it "does for BigDecimal from int" do
  #     big = BigDecimal.from_json(JSON.parse("1234"))
  #     big.should be_a(BigDecimal)
  #     big.should eq(BigDecimal.new("1234"))
  #   end
  #
  #   it "does for BigDecimal from float" do
  #     big = BigDecimal.from_json(JSON.parse("1234.05"))
  #     big.should be_a(BigDecimal)
  #     big.should eq(BigDecimal.new("1234.05"))
  #   end

  it "does for Enum with number" do
    JSONSpecEnum.from_json(JSON.parse("1")).should eq(JSONSpecEnum::One)

    expect_raises(Exception, "Unknown enum JSONSpecEnum value: 3") do
      JSONSpecEnum.from_json(JSON.parse("3"))
    end
  end

  it "does for Enum with string" do
    JSONSpecEnum.from_json(JSON.parse(%("One"))).should eq(JSONSpecEnum::One)

    expect_raises(ArgumentError, "Unknown enum JSONSpecEnum value: Three") do
      JSONSpecEnum.from_json(JSON.parse(%("Three")))
    end
  end

  it "deserializes union" do
    Array(Int32 | String).from_json(JSON.parse(%([1, "hello"]))).should eq([1, "hello"])
  end

  it "deserializes union with bool (fast path)" do
    Union(Bool, Array(Int32)).from_json(JSON.parse(%(true))).should be_true
  end

  it "deserializes union of array and bool" do
    Union(Bool, Array(Int32)).from_json(JSON.parse(%([42]))).should eq([42])
  end

  {% for type in %w(Int8 Int16 Int32 Int64 UInt8 UInt16 UInt32 UInt64).map(&.id) %}
  it "deserializes union with {{type}} (fast path)" do
    Union({{type}}, Array(Int32)).from_json(JSON.parse(%(#{ {{type}}::MAX }))).should eq({{type}}::MAX)
  end
  {% end %}

  it "deserializes union with Float32 (fast path)" do
    Union(Float32, Array(Int32)).from_json(JSON.parse(%(1))).should eq(1)
    Union(Float32, Array(Int32)).from_json(JSON.parse(%(1.23))).should eq(1.23_f32)
  end

  it "deserializes union with Float64 (fast path)" do
    Union(Float64, Array(Int32)).from_json(JSON.parse(%(1))).should eq(1)
    Union(Float64, Array(Int32)).from_json(JSON.parse(%(1.23))).should eq(1.23)
  end

  it "deserializes union of Int32 and Float64" do
    value = Union(Int32, Float64).from_json(JSON.parse("1"))
    value.should be_a(Int32)
    value.should eq(1)

    value = Union(Int32, Float64).from_json(JSON.parse("1.0"))
    value.should be_a(Float64)
    value.should eq(1.0)
  end

  it "deserializes unions of the same kind and remains stable" do
    str = [Int32::MAX, Int64::MAX].to_json
    value = Array(Int32 | Int64).from_json(JSON.parse(str))
    value.all? { |x| x.should be_a(Int64) }
  end

  it "deserializes unions without primitive types" do
    data = JSON.parse(%([{"num":1,"str":"hello"}, 42]))
    Array(Int32 | JSONSpecNonPrimitive).from_json(data).should eq([JSONSpecNonPrimitive.new(:one, "hello"), 42])
  end

  #   it "deserializes Time" do
  #     Time.from_json(JSON.parse(%("2016-11-16T09:55:48-03:00")).to_utc.should eq(Time.utc(2016, 11, 16, 12, 55, 48)))
  #     Time.from_json(JSON.parse(%("2016-11-16T09:55:48-0300")).to_utc.should eq(Time.utc(2016, 11, 16, 12, 55, 48)))
  #     Time.from_json(JSON.parse(%("20161116T095548-03:00")).to_utc.should eq(Time.utc(2016, 11, 16, 12, 55, 48)))
  #   end
end
