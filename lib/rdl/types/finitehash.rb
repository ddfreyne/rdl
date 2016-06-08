require_relative 'type'

module RDL::Type
  # A specialized GenericType for fixed-sized maps from values to
  # types, for "named" arguments in Ruby. Values are compared with ==
  # to see if they match.
  class FiniteHashType < Type
    attr_reader :elts
    attr_reader :the_hash # either nil or hash type if self has been promoted to hash
    attr_reader :ubounds  # upper bounds this tuple has been compared with using <=
    attr_reader :lbounds  # lower bounds...

    @@hash_type = nil

    # [+elts+] is a map from keys to types
    def initialize(elts)
      elts.each { |k, t|
        raise RuntimeError, "Got #{t.inspect} where Type expected" unless t.is_a? Type
        raise RuntimeError, "Type may not be annotated or vararg" if (t.instance_of? AnnotatedArgType) || (t.instance_of? VarargType)
      }
      @elts = elts
      @the_hash = nil
      @ubounds = []
      @lbounds = []
      @@hash_type = NominalType.new(Hash) unless @@hash_type
      super()
    end

    def to_s
      return @the_hash.to_s if the_hash
      "{" + @elts.map { |k, t| k.to_s + ": " + t.to_s }.join(', ') + "}"
    end

    def eql?(other)
      self == other
    end

    def ==(other) # :nodoc:
      return (@the_hash == other) if @the_hash
      return (other.instance_of? FiniteHashType) && (other.elts == @elts)
    end

    def match(other)
      return @the_hash.match(other) if @the_hash
      other = other.type if other.instance_of? AnnotatedArgType
      return true if other.instance_of? WildQuery
      return (@elts.length == other.elts.length &&
              @elts.all? { |k, v| (other.elts.has_key? k) && (v.match(other.elts[k]))})
    end

    def <=(other)
      return @the_hash <= other if @the_hash
      return true if other.instance_of? TopType
      other = other.the_hash if other.instance_of?(FiniteHashType) && other.the_hash
      if other.instance_of? FiniteHashType
        # Like Tuples, FiniteHashes are immutable, so covariant subtyping allowed
        # But note, no width subtyping allowed, to match #member?
        rest = other.elts.clone # shallow copy
        @elts.each_pair { |k, tleft|
          return false unless rest.has_key? k
          tright = rest[k]
          tleft = tleft.type if tleft.instance_of? OptionalType
          tright = tright.type if tright.instance_of? OptionalType
          return false unless tleft <= tright
          rest.delete k
        }
        rest.each_pair { |k, tright|
          return false unless tright.instance_of? OptionalType
        }
        ubounds << other
        other.lbounds << self
        return true
      end
      if (other.instance_of? GenericType) && (other.base == @@hash_type)
        @@the_hash = GenericType.new(@@hash_type, a, b)
        # same logic as Tuple
        return (self <= other) && (@lbounds.all? { |lbound| lbound <= self }) && (@ubounds.all? { |ubound| self <= ubound })
      end
      return false
    end

    def member?(obj, *args)
      return @the_hash.member(obj, *args) if @the_hash
      t = RDL::Util.rdl_type obj
      return t <= self if t
      rest = @elts.clone # shallow copy

      return false unless obj.instance_of? Hash

      # Check that every mapping in obj exists in @map and matches the type
      obj.each_pair { |k, v|
        return false unless @elts.has_key? k
        t = @elts[k]
        t = t.type if t.instance_of? OptionalType
        return false unless t.member? v
        rest.delete(k)
      }

      # Check that any remaining types are optional
      rest.each_pair { |k, vt|
        return false unless vt.instance_of? OptionalType
      }

      return true
    end

    def instantiate(inst)
      return @the_hash.instantiate(inst) if @the_hash
      return FiniteHashType.new(Hash[@elts.map { |k, t| [k, t.instantiate(inst)] }])
    end

    def hash
      # note don't change hash value if @the_hash becomes non-nil
      229 * @elts.hash
    end
  end
end
