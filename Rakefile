require 'rspec/core/rake_task'


namespace 'prime_number_generator' do

  desc 'Run all of the RSpec specifications'
  RSpec::Core::RakeTask.new(:specs) do |t, args|
    t.rspec_opts = '--pattern test/**/*_spec.rb'
  end

end


task default: 'prime_number_generator:specs'
