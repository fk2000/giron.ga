class MatchData
  attr_reader :post_match, :pre_match, :regexp, :string

  def initialize(regexp, match_groups)
    $~          = self
    @regexp     = regexp
    @begin      = `match_groups.index`
    @string     = `match_groups.input`
    @pre_match  = `match_groups.input.slice(0, match_groups.index)`
    @post_match = `match_groups.input.slice(match_groups.index + match_groups[0].length)`
    @matches    = []

    %x{
      for (var i = 0, length = match_groups.length; i < length; i++) {
        var group = match_groups[i];

        if (group == null) {
          #@matches.push(nil);
        }
        else {
          #@matches.push(group);
        }
      }
    }
  end

  def [](*args)
    @matches[*args]
  end

  def offset(n)
    %x{
      if (n !== 0) {
        #{raise ArgumentError, 'MatchData#offset only supports 0th element'}
      }
      return [self.begin, self.begin + self.matches[n].length];
    }
  end

  def ==(other)
    return false unless MatchData === other

    `self.string == other.string` &&
    `self.regexp.toString() == other.regexp.toString()` &&
    `self.pre_match == other.pre_match` &&
    `self.post_match == other.post_match` &&
    `self.begin == other.begin`
  end

  alias eql? ==

  def begin(n)
    %x{
      if (n !== 0) {
        #{raise ArgumentError, 'MatchData#begin only supports 0th element'}
      }
      return self.begin;
    }
  end

  def end(n)
    %x{
      if (n !== 0) {
        #{raise ArgumentError, 'MatchData#end only supports 0th element'}
      }
      return self.begin + self.matches[n].length;
    }
  end

  def captures
    `#@matches.slice(1)`
  end

  def inspect
    %x{
      var str = "#<MatchData " + #{`#@matches[0]`.inspect};

      for (var i = 1, length = #@matches.length; i < length; i++) {
        str += " " + i + ":" + #{`#@matches[i]`.inspect};
      }

      return str + ">";
    }
  end

  def length
    `#@matches.length`
  end

  alias size length

  def to_a
    @matches
  end

  def to_s
    `#@matches[0]`
  end

  def values_at(*args)
    %x{
      var i, a, index, values = [];

      for (i = 0; i < args.length; i++) {

        if (args[i].$$is_range) {
          a = #{`args[i]`.to_a};
          a.unshift(i, 1);
          Array.prototype.splice.apply(args, a);
        }

        index = #{Opal.coerce_to!(`args[i]`, Integer, :to_int)};

        if (index < 0) {
          index += #@matches.length;
          if (index < 0) {
            values.push(nil);
            continue;
          }
        }

        values.push(#@matches[index]);
      }

      return values;
    }
  end
end
