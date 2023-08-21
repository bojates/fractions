class Fraction
  attr_reader :numerator, :denominator

  def initialize(numerator, denominator)
    @numerator = numerator
    @denominator = denominator

    check_input
    simplify
  end

  def +(other)
    result = Fraction.new(numerator * other.denominator + other.numerator * denominator, 
                          denominator * other.denominator)

    result.simplify
    result
  end

  def ==(other)
    numerator == other.numerator && denominator == other.denominator
  end

  protected

  def simplify
    if denominator.negative? && numerator.negative? 
      @denominator = denominator.abs
      @numerator = numerator.abs
    end

    denominator.abs.downto(2) do |n| 
      if numerator % n == 0 && denominator % n == 0
        @numerator = numerator / n
        @denominator = denominator / n
        break
      end
    end
  end
  
  private

  def check_input
    raise ArgumentError, "Denominator can't be 0" if denominator == 0 
    raise ArgumentError, "Numerator missing" if numerator.nil? 
    raise ArgumentError, "Denominator missing" if denominator.nil?
    raise ArgumentError, "Denominator must be a number" if !denominator.is_a? Numeric
    raise ArgumentError, "Numerator must be a number" if !numerator.is_a? Numeric
  end

end