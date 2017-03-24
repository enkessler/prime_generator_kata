describe 'generate_primes.rb' do

  it 'outputs prime numbers' do
    expect(`ruby bin/generate_primes 7900 7920`).to eq('7901, 7907, 7919')
  end

end
