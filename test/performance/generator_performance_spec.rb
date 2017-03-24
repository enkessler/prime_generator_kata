require_relative '../spec_helper'


describe PrimeNumberGenerator::Generator, 'performance tests' do

  describe 'generating primes' do

    # Sanity check
    it 'can handle a large numbers' do
      a_reasonable_calculation_time = 10

      start_time = Time.now
      subject.generate_primes(1, 1000000)
      end_time = Time.now

      expect(end_time - start_time).to be < a_reasonable_calculation_time
    end

    # Making sure that time isn't spent generating primes that aren't in the
    # range in the first place, as a naive implementation might do
    it 'can handle a large numbers with small ranges' do
      skip('Not expecting this one to pass until we use a modified sieve instead of the built in one')

      start_time = Time.now
      subject.generate_primes(1000000, 1000003)
      end_time = Time.now

      expect(end_time - start_time).to be < 1
    end

  end

end
