require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'

RSpec.configure do |config|
  config.include Capybara::DSL, type: :feature
end

# By default, Capybara will try to boot a rack application, so we need to switch it off
Capybara.run_server = false
# The default driver is :rack_test, which does not support Javascript, so we need to switch to Selenium
Capybara.default_driver = :selenium
Capybara.default_selector = :css
# Set default wait time for page elements lookup to 5 seconds
Capybara.default_wait_time = 5

ROOT_URL = 'http://localhost:8000'

def verify_content(texts)
  texts.each { |text|
    puts "Looking for string '#{text}'"
    expect(page).to have_content(text)
  }
end
