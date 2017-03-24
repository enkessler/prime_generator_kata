# Ruby's built in Prime number library
require 'prime'


module PrimeNumberGenerator
  class Generator

    def generate_primes(start_number, end_number)
      validate_input(start_number)
      validate_input(end_number)

      start_number, end_number = [start_number, end_number].sort

      generate_prime_list(start_number, end_number)
    end

    def isPrime(candidate_number)
      # May need to make our own tester if this one turns out to be too slow.
      Prime.prime?(candidate_number)
    end

    alias :is_prime? :isPrime


    private


    def validate_input(number)
      raise(ArgumentError, "Input must be a positive number but was given '#{number.inspect}'") unless number.is_a?(Integer) && (number > 0)
    end

    def generate_prime_list(start_number, end_number)
      #todo - Refactor this method so that is uses a modified sieve algorithm that only generates primes within start_number and end_number instead of trimming an excessive list
      generator = Prime::EratosthenesGenerator.new

      prime_list = [0]

      until prime_list.last >= end_number
        prime_list << generator.next
      end

      # The list is likely to have primes from before the starting number and possibly one more after the ending number
      prime_list.select { |prime| (prime >= start_number) && (prime <= end_number) }
    end

  end
end
