require 'simplecov'

SimpleCov.minimum_coverage 100
SimpleCov.start do
  add_filter '/spec/'
end

require 'mygem'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
