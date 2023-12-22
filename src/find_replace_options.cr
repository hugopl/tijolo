struct FindReplaceParser
  SEPARATOR = '/'
  ESCAPE    = '\\'

  @reader : Char::Reader
  @char_on_hold : Char = Char::ZERO

  def initialize(text : String)
    @reader = Char::Reader.new(text)
  end

  def consume_separator? : Bool
    chr = @reader.current_char
    return true if chr == SEPARATOR

    @char_on_hold = chr
    false
  end

  def read_term : String
    str = String::Builder.new

    if @char_on_hold != Char::ZERO
      str << @char_on_hold
      @char_on_hold = Char::ZERO
    end

    escaping = false
    while @reader.has_next?
      chr = @reader.next_char
      if escaping
        case chr
        when 'n' then str << '\n'
        when 't' then str << '\t'
        when '/' then str << '/'
        else
          str << ESCAPE << chr
        end
        escaping = false
      else
        case chr
        when SEPARATOR, Char::ZERO
          break
        when ESCAPE
          escaping = true
        else
          str << chr
        end
      end
    end

    str.to_s
  end
end

struct FindReplaceOptions
  getter find_term : String
  getter replace_term : String?
  getter? case_sensitive : Bool
  getter? regex : Bool

  def initialize(@regex, @find_term, @replace_term, @case_sensitive)
  end

  def self.parse(text : String) : self?
    parser = FindReplaceParser.new(text)
    regex = parser.consume_separator?
    case_sensitive = regex
    find_term = parser.read_term
    replace_term = parser.read_term if parser.consume_separator?
    case_sensitive = (parser.read_term != "i") if parser.consume_separator?
    new(regex, find_term, replace_term, case_sensitive)
  end
end
