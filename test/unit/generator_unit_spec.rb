require_relative '../spec_helper'


describe PrimeNumberGenerator::Generator, 'unit tests' do

  it_should_behave_like 'a prime number generator'


  describe 'primality determination' do

    it 'provides a more Ruby-ish name for #isPrime' do
      expect(subject).to respond_to(:is_prime?)
      expect(subject.method(:is_prime?)).to eq(subject.method(:isPrime))
    end

    it 'correctly determines the primality of a number' do
      expect(subject.is_prime?(2)).to be true
      expect(subject.is_prime?(4)).to be false
      expect(subject.is_prime?(7)).to be true
    end

    it 'does not consider 1 to be prime' do
      expect(subject.is_prime?(1)).to be false
    end

  end


  describe 'generating primes' do

    it 'can handle matching endpoints' do
      expect(subject.generate_primes(7, 7)).to eq([7])
    end

    it 'can handle a range with no primes' do
      expect(subject.generate_primes(99, 100)).to eq([])
    end

    it 'can handle the lowest possible input' do
      expect(subject.generate_primes(1, 1)).to eq([])
    end

    it 'can handle a reversed input range' do
      forward_answer = subject.generate_primes(1, 100)

      expect(subject.generate_primes(100, 1)).to eq(forward_answer)
    end

    it 'includes the endpoints in its calculation' do
      expect(subject.generate_primes(2, 7)).to eq([2, 3, 5, 7]) # (prime, prime)
      expect(subject.generate_primes(2, 6)).to eq([2, 3, 5]) # (prime, not prime)
      expect(subject.generate_primes(4, 7)).to eq([5, 7]) # (not prime, prime)
      expect(subject.generate_primes(4, 8)).to eq([5, 7]) # (not prime, not prime)
    end


    context 'with bad input' do

      it 'complains if given nothing' do
        expect { subject.generate_primes(1, nil) }.to raise_error(ArgumentError, "Input must be a positive number but was given 'nil'")
        expect { subject.generate_primes(nil, 1) }.to raise_error(ArgumentError, "Input must be a positive number but was given 'nil'")
      end

      it 'complains if given not numbers' do
        expect { subject.generate_primes(1, 'a') }.to raise_error(ArgumentError, "Input must be a positive number but was given '\"a\"'")
        expect { subject.generate_primes('a', 1) }.to raise_error(ArgumentError, "Input must be a positive number but was given '\"a\"'")
      end

      it 'complains if given negative numbers' do
        expect { subject.generate_primes(1, -1) }.to raise_error(ArgumentError, "Input must be a positive number but was given '-1'")
        expect { subject.generate_primes(-1, 1) }.to raise_error(ArgumentError, "Input must be a positive number but was given '-1'")
      end

    end

  end

end
