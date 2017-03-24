shared_examples_for 'a prime number generator' do

  describe 'API' do

    it 'can generate prime numbers' do
      expect(subject).to respond_to(:generate_primes)
    end

    it 'generates prime numbers based on a starting and ending number' do
      expect(subject.method(:generate_primes).arity).to eq(2)
    end

    it 'returns a list of prime numbers' do
      expect(subject.generate_primes(1,1)).to be_an(Array)
    end

    it 'can determine if a number is prime' do
      expect(subject).to respond_to(:isPrime)
    end

    it 'determines the primality of a single number' do
      expect(subject.method(:isPrime).arity).to eq(1)
    end

  end

end
