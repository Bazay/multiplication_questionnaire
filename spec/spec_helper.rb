require "bundler/setup"
require "multiplication_questionnaire"
require 'rspec/its'

Dir["./../lib/multiplication_questionnaire/*.rb"].each {|file| require file }

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
