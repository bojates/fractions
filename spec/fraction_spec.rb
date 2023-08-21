require 'fraction'

RSpec.describe Fraction do

  it 'creates a Fraction object when passed a numerator and a demoninator' do 
    expect(Fraction.new(1, 2).is_a?(Fraction)).to be true
  end

  it 'expresses the fraction as its simplest expression' do 
    expect(Fraction.new(3, 6)).to eq Fraction.new(1, 2)
    expect(Fraction.new(56, 112)).to eq Fraction.new(1, 2)
  end
  it 'simplifies negatives' do 
    expect(Fraction.new(-56, -112)).to eq Fraction.new(1, 2)
  end

  describe 'Adding' do 
    it 'adds two Fraction objects together' do 
      expect(Fraction.new(1, 3) + Fraction.new(1, 3)).to eq Fraction.new(2, 3)
    end
    
    it 'returns the added fraction as its simplest expression' do 
      expect(Fraction.new(1, 2) + Fraction.new(1, 2)).to eq Fraction.new(1, 1)
    end

    it 'simplifies when given different denominators, and the result denominator is lower than provided' do 
      expect(Fraction.new(1, 3) + Fraction.new(1, 6)).to eq Fraction.new(1, 2)
    end
    
    it 'simplifies when given different denominators, and the result denominator is higher than provided' do 
      expect(Fraction.new(1, 4) + Fraction.new(2, 6)).to eq Fraction.new(7, 12)
    end
    
    it 'returns fractions as improper, not mixed' do 
      expect(Fraction.new(3, 4) + Fraction.new(3, 4)).to eq Fraction.new(3, 2)
    end

    it 'handles negative fractions in the numerator' do 
      expect(Fraction.new(-4, 5) + Fraction.new(6, 5)).to eq Fraction.new(2, 5)
    end

    it 'handles negative fractions in the denominator' do 
      expect(Fraction.new(4, -5) + Fraction.new(6, 5)).to eq Fraction.new(2, 5)
    end

    it 'handles negative fractions when the result is 0' do 
      expect(Fraction.new(-4, 5) + Fraction.new(4, 5)).to eq Fraction.new(0, 1)
      expect(Fraction.new(-4, 5) + Fraction.new(4, 5)).to eq 0
    end

    it 'returns whole numbers with denominators of 1' do 
      expect(Fraction.new(1, 2) + Fraction.new(1, 2)).to eq 1
    end
    
  end
    
  describe 'Input checks' do 
    it 'returns an error if a numerator is missing' do 
      expect { Fraction.new(nil, 2) }.to raise_error(ArgumentError)
    end 

    it 'returns an error if a denominator is missing' do 
      expect { Fraction.new(2, nil) }.to raise_error(ArgumentError)
    end
    
    it 'returns an error if the denominator is not a number' do 
      expect { Fraction.new(2, 'Number') }.to raise_error(ArgumentError, "Denominator must be a number")
    end

    it 'returns an error if the numerator is not a number' do 
      expect { Fraction.new('Not A Number', 2)}.to raise_error(ArgumentError, "Numerator must be a number")
    end

    it 'returns an error if the denominator is 0' do 
      expect { Fraction.new(2, 0) }.to raise_error(ArgumentError, "Denominator can't be 0")
    end

  end
end