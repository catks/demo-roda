#Integration Test
require_relative '../spec_helper'
require "capybara"
require "capybara/dsl"

Capybara.configure do |config|
  config.app = App.app
end

RSpec.configure do |config|
  config.include Capybara::DSL
end

