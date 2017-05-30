rdl_nowrap :BigDecimal

type :BigDecimal, :%, '(%numeric) -> BigDecimal'
pre(:BigDecimal, :%) { |x| x!=0&&(if x.is_a?(Float) then x!=Float::INFINITY && !x.nan? else true end)}

type :BigDecimal, :+, '(%integer) -> BigDecimal'
type :BigDecimal, :+, '(Float x {{ !x.infinite? && !x.nan? }}) -> BigDecimal'
type :BigDecimal, :+, '(Rational) -> BigDecimal'
type :BigDecimal, :+, '(BigDecimal) -> BigDecimal'
type :BigDecimal, :+, '(Complex) -> Complex'
pre(:BigDecimal, :+) { |x| if x.real.is_a?(Float) then x.real!=Float::INFINITY && !(x.real.nan?) else true end}

type :BigDecimal, :-, '(%integer) -> BigDecimal'
type :BigDecimal, :-, '(Float x {{ !x.infinite? && !x.nan? }}) -> BigDecimal'
type :BigDecimal, :-, '(Rational) -> BigDecimal'
type :BigDecimal, :-, '(BigDecimal) -> BigDecimal'
type :BigDecimal, :-, '(Complex) -> Complex'
pre(:BigDecimal, :-) { |x| if x.real.is_a?(Float) then x.real!=Float::INFINITY && !(x.real.nan?) else true end}

type :BigDecimal, :-@, '() -> BigDecimal'

type :BigDecimal, :+@, '() -> BigDecimal'

type :BigDecimal, :*, '(%integer) -> BigDecimal'
type :BigDecimal, :*, '(Float x {{ !x.infinite? && !x.nan? }}) -> BigDecimal'
type :BigDecimal, :*, '(Rational) -> BigDecimal'
type :BigDecimal, :*, '(BigDecimal) -> BigDecimal'
type :BigDecimal, :*, '(Complex) -> Complex'
pre(:BigDecimal, :*) { |x| if x.real.is_a?(Float) then (x.real!=Float::INFINITY && !(x.real.nan?)) elsif(x.imaginary.is_a?(Float)) then x.imaginary!=Float::INFINITY && !(x.imaginary.nan?) else true end}

type :BigDecimal, :**, '(%integer) -> BigDecimal'
type :BigDecimal, :**, '(Float) -> BigDecimal'
pre(:BigDecimal, :**) { |x| x!=Float::INFINITY && !x.nan? && if(self<0) then x<=-1||x>=0 else true end}
type :BigDecimal, :**, '(Rational) -> BigDecimal'
pre(:BigDecimal, :**) { |x| if(self<0) then x<=-1||x>=0 else true end}
type :BigDecimal, :**, '(BigDecimal) -> BigDecimal'
pre(:BigDecimal, :**) { |x| x!=BigDecimal::INFINITY && if(self<0) then x<=-1||x>=0 else true end}

type :BigDecimal, :/, '(%integer x {{ x!=0 }}) -> BigDecimal'
type :BigDecimal, :/, '(Float x {{ x!=0 && !x.infinite? && !x.nan? }}) -> BigDecimal'
type :BigDecimal, :/, '(Rational x {{ x!=0 }}) -> BigDecimal'
type :BigDecimal, :/, '(BigDecimal x {{ x!=0 }}) -> BigDecimal'
type :BigDecimal, :/, '(Complex x {{ x!=0 }}) -> Complex'
pre(:BigDecimal, :/) { |x| if x.real.is_a?(Float) then x.real!=Float::INFINITY && !(x.real.nan?) else true end && if x.imaginary.is_a?(Float) then x.imaginary!=Float::INFINITY && !(x.imaginary.nan?) else true end && if (x.real.is_a?(Rational)) then !x.imaginary.nan? else true end}

type :BigDecimal, :<, '(%integer) -> %bool'
type :BigDecimal, :<, '(Float x {{ !x.nan? && !x.infinite? }}) -> %bool'
type :BigDecimal, :<, '(Rational) -> %bool'
type :BigDecimal, :<, '(BigDecimal) -> %bool'

type :BigDecimal, :<=, '(%integer) -> %bool'
type :BigDecimal, :<=, '(Float x {{ !x.nan? && !x.infinite }}) -> %bool'
type :BigDecimal, :<=, '(Rational) -> %bool'
type :BigDecimal, :<=, '(BigDecimal) -> %bool'

type :BigDecimal, :>, '(%integer) -> %bool'
type :BigDecimal, :>, '(Float x {{ !x.nan? && !x.infinite? }}) -> %bool'
type :BigDecimal, :>, '(Rational) -> %bool'
type :BigDecimal, :>, '(BigDecimal) -> %bool'

type :BigDecimal, :>=, '(%integer) -> %bool'
type :BigDecimal, :>=, '(Float x {{ !x.nan? && !x.infinite? }}) -> %bool'
type :BigDecimal, :>=, '(Rational) -> %bool'
type :BigDecimal, :>=, '(BigDecimal) -> %bool'

type :BigDecimal, :==, '(Object) -> %bool'
pre(:BigDecimal, :==) { |x| if (x.is_a?(Float)) then (!x.nan? && x!=Float::INFINITY) else true end}

type :BigDecimal, :===, '(Object) -> %bool'
pre(:BigDecimal, :===) { |x| if (x.is_a?(Float)) then (!x.nan? && x!=Float::INFINITY) else true end}

type :BigDecimal, :<=>, '(%integer) -> Object'
post(:BigDecimal, :<=>) { |r,x| r == -1 || r==0 || r==1}
type :BigDecimal, :<=>, '(Float) -> Object'
pre(:BigDecimal, :<=>) { |x| !x.nan? && x!=Float::INFINITY}
post(:BigDecimal, :<=>) { |r,x| r == -1 || r==0 || r==1}
type :BigDecimal, :<=>, '(Rational) -> Object'
post(:BigDEcimal, :<=>) { |r,x| r == -1 || r==0 || r==1}
type :BigDecimal, :<=>, '(BigDecimal) -> Object'
post(:BigDecimal, :<=>) { |r,x| r == -1 || r==0 || r==1}

type :BigDecimal, :abs, '() -> BigDecimal r {{ r>=0 || (if r.nan? then self.nan? end) }}'

type :BigDecimal, :abs2, '() -> BigDecimal r {{ r>=0 || (if r.nan? then self.nan? end) }}'

type :BigDecimal, :angle, '() -> %numeric'
post(:BigDecimal, :angle) { |r,x| r == 0 || r == Math::PI}

type :BigDecimal, :arg, '() -> %numeric'
post(:BigDecimal, :arg) { |r,x| r == 0 || r == Math::PI}

type :BigDecimal, :ceil, '() -> %integer'
pre(:BigDecimal, :ceil) { !self.infinite? && !self.nan?}

type :BigDecimal, :conj, '() -> BigDecimal'
type :BigDecimal, :conjugate, '() -> BigDecimal'

type :BigDecimal, :denominator, '() -> %integer'
pre(:BigDecimal, :denominator) { !self.infinite? && !self.nan?}
post(:BigDecimal, :denominator) { |r,x| r>0}

type :BigDecimal, :div, '(Fixnum x {{ x!=0 && !self.infinite? && !self.nan? }}) -> %integer'
type :BigDecimal, :div, '(Bignum x {{ x!=0 && !self.infinite? && !self.nan? }}) -> %integer'
type :BigDecimal, :div, '(Float x {{ x!=0 && !self.infinite? && !self.nan? && !x.infinite? && !x.nan? }}) -> %integer'
type :BigDecimal, :div, '(Rational x {{ x!=0 && !self.infinite? && !self.nan? }}) -> %integer'
type :BigDecimal, :div, '(BigDecimal x {{ x!=0 && !self.infinite? && !self.nan? && !x.infinite? && !x.nan? }}) -> %integer'

type :BigDecimal, :divmod, '(%real) -> [%real, %real]'
pre(:BigDecimal, :divmod) { |x| x!=0 && if x.is_a?(Float) then !x.nan? && x!=Float::INFINITY else true end}

type :BigDecimal, :equal?, '(Object) -> %bool'
type :BigDecimal, :eql?, '(Object) -> %bool'

type :BigDecimal, :fdiv, '(%integer) -> Float'
type :BigDecimal, :fdiv, '(Float) -> Float'
type :BigDecimal, :fdiv, '(Rational) -> Float'
type :BigDecimal, :fdiv, '(BigDecimal) -> BigDecimal'
type :BigDecimal, :fdiv, '(Complex) -> Complex'
pre(:BigDecimal, :fdiv) { |x| x!=0 && if (x.real.is_a?(BigDecimal)||x.imaginary.is_a?(BigDecimal)) then (if x.real.is_a?(Float) then (x.real!=Float::INFINITY && !(x.real.nan?)) elsif(x.imaginary.is_a?(Float)) then x.imaginary!=Float::INFINITY && !(x.imaginary.nan?) else true end) else true end && if (x.real.is_a?(Rational) && x.imaginary.is_a?(Float)) then !x.imaginary.nan? else true end}

type :BigDecimal, :finite?, '() -> %bool'

type :BigDecimal, :floor, '() -> %integer'
pre(:BigDecimal, :floor) { !self.infinite? && !self.nan?}

type :BigDecimal, :hash, '() -> %integer'

type :BigDecimal, :imag, '() -> Fixnum r {{ r==0 }}'
type :BigDecimal, :imaginary, '() -> Fixnum r {{ r==0 }}'

type :BigDecimal, :infinite?, '() -> NilClass or Fixnum'

type :BigDecimal, :to_s, '() -> String'
type :BigDecimal, :inspect, '() -> String'

type :BigDecimal, :magnitude, '() -> BigDecimal r {{ r>=0 }}'

type :BigDecimal, :modulo, '(%numeric) -> BigDecimal'
pre(:BigDecimal, :modulo) { |x| x!=0&&(if x.is_a?(Float) then x!=Float::INFINITY && !x.nan? else true end)}

type :BigDecimal, :nan?, '() -> %bool'

type :BigDecimal, :numerator, '() -> %integer'
pre(:BigDecimal, :numerator) { !self.infinite? && !self.nan?}

type :BigDecimal, :phase, '() -> %numeric'

type :BigDecimal, :quo, '(%integer x {{ x!=0 }}) -> BigDecimal'
type :BigDecimal, :quo, '(Float x {{ x!=0 && !x.infinite? && !x.nan?}}) -> BigDecimal'
type :BigDecimal, :quo, '(Rational x {{ x!=0 }}) -> BigDecimal'
type :BigDecimal, :quo, '(BigDecimal x {{ x!=0 }}) -> BigDecimal'
type :BigDecimal, :quo, '(Complex) -> Complex'
pre(:BigDecimal, :quo) { |x| x!=0 && if x.real.is_a?(Float) then x.real!=Float::INFINITY && !(x.real.nan?) else true end && if x.imaginary.is_a?(Float) then x.imaginary!=Float::INFINITY && !(x.imaginary.nan?) else true end && if (x.real.is_a?(Rational)) then !x.imaginary.nan? else true end}

type :BigDecimal, :real, '() -> BigDecimal'

type :BigDecimal, :real?, '() -> true'

type :BigDecimal, :round, '() -> %integer'
pre(:BigDecimal, :round) { !self.infinite? && !self.nan?}

type :BigDecimal, :round, '(Fixnum) -> BigDecimal' #Also, x must be in range [-2**31, 2**31].

type :BigDecimal, :to_f, '() -> Float'
pre(:BigDecimal, :to_f) { self<=Float::MAX}

type :BigDecimal, :to_i, '() -> %integer'
pre(:BigDecimal, :to_i) { !self.infinite? && !self.nan?}
type :BigDecimal, :to_int, '() -> %integer'
pre(:BigDecimal, :to_int) { !self.infinite? && !self.nan?}

type :BigDecimal, :to_r, '() -> Rational'
pre(:BigDecimal, :to_r) { !self.infinite? && !self.nan?}

type :BigDecimal, :to_c, '() -> Complex r {{ r.imaginary == 0 }}'
post(:BigDecimal, :to_c) { |r,x| r.imaginary == 0 }

type :BigDecimal, :truncate, '() -> %integer'

type :BigDecimal, :truncate, '(Fixnum) -> Rational' #Also, x must be in range [-2**31, 2**31].

type :BigDecimal, :zero?, '() -> %bool'

type :BigDecimal, :precs, '() -> [%integer, %integer]'

type :BigDecimal, :split, '() -> [Fixnum, String, %integer, %integer]'

type :BigDecimal, :remainder, '(%real) -> BigDecimal'
pre(:BigDecimal, :remainder) { |x| if x.is_a?(Float) then !x.infinite? && !x.nan? else true end}

type :BigDecimal, :fix, '() -> BigDecimal'

type :BigDecimal, :frac, '() -> BigDecimal'

type :BigDecimal, :power, '(%integer) -> BigDecimal'
type :BigDecimal, :power, '(Float) -> BigDecimal'
pre(:BigDecimal, :power) { |x| x!=Float::INFINITY && !x.nan? && if(self<0) then x<=-1||x>=0 else true end}
type :BigDecimal, :power, '(Rational) -> BigDecimal'
pre(:BigDecimal, :power) { |x| if(self<0) then x<=-1||x>=0 else true end}
type :BigDecimal, :power, '(BigDecimal) -> BigDecimal'
pre(:BigDecimal, :power) { |x| x!=BigDecimal::INFINITY && if(self<0) then x<=-1||x>=0 else true end}

type :BigDecimal, :nonzero?, '() -> Object'

type :BigDecimal, :exponent, '() -> %integer'

type :BigDecimal, :sign, '() -> Fixnum'

type :BigDecimal, :_dump, '() -> String'

type :BigDecimal, :sqrt, '(Fixnum) -> BigDecimal'
pre(:BigDecimal, :sqrt) { self>=0}

type :BigDecimal, :add, '(%real, Fixnum) -> BigDecimal'
pre(:BigDecimal, :add) { |x,y| if x.is_a?(Float) then !x.infinite? && !x.nan? else true end}

type :BigDecimal, :sub, '(%real, Fixnum) -> BigDecimal'
pre(:BigDecimal, :sub) { |x,y| if x.is_a?(Float) then !x.infinite? && !x.nan? else true end}

type :BigDecimal, :mult, '(%real, Fixnum) -> BigDecimal'
pre(:BigDecimal, :mult) { |x,y| if x.is_a?(Float) then !x.infinite? && !x.nan? else true end}

type :BigDecimal, :coerce, '(%real) -> [BigDecimal, BigDecimal]'
pre(:BigDecimal, :coerce) { |x| if x.is_a?(Float) then !x.nan? && !x.finite? else true end}
