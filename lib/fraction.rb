class Fraction
  attr_reader :numerator, :denominator

  def initialize(numerator, denominator = 1)
    check_input(numerator, denominator)

    if denominator.negative? && numerator.negative? 
      denominator = denominator.abs
      numerator = numerator.abs
    end

    gcd = gcd(numerator, denominator)
    @numerator = numerator / gcd
    @denominator = denominator / gcd
  end

  def +(other)
    Fraction.new(numerator * other.denominator + other.numerator * denominator, 
                          denominator * other.denominator)
  end

  def ==(other)
    numerator == other.numerator && denominator == other.denominator
  end

  private
  
  def gcd(a, b)
    while b != 0
      t = b
      b = a % b
      a = t
    end

    return a
  end

  def check_input(numerator, denominator)
    raise ArgumentError, "Denominator can't be 0" if denominator == 0 
    raise ArgumentError, "Numerator missing" if numerator.nil? 
    raise ArgumentError, "Denominator missing" if denominator.nil?
    raise ArgumentError, "Denominator must be a number" if !denominator.is_a? Numeric
    raise ArgumentError, "Numerator must be a number" if !numerator.is_a? Numeric
  end

end