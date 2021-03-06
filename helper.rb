require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'
require 'capybara-screenshot'
require 'capybara-screenshot/rspec'
require 'pry'

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
# HTML files & screenshots at failure points will be saved in output folder
Capybara.save_and_open_page_path = './output'
Capybara::Screenshot::RSpec.add_link_to_screenshot_for_failed_examples = true
Capybara::Screenshot::RSpec::REPORTERS['RSpec::Core::Formatters::HtmlFormatter'] = Capybara::Screenshot::RSpec::HtmlEmbedReporter

ROOT_URL = 'http://localhost:8000'

def verify_content(texts)
  texts.each { |text|
    puts "Looking for string '#{text}'"
    expect(page).to have_content(text)
  }
end

def random_string(length)
  (0...length).map { (65 + rand(26)).chr }.join
end

def login(user, password)
  visit ROOT_URL + '/main'
  click_on 'Login'
  fill_in 'id_username', with: user
  fill_in 'id_password', with: password
  click_on 'Login'
end

def fill_in_ckeditor(locator, opts)
  content = opts.fetch(:with).to_json
  page.execute_script <<-SCRIPT
    CKEDITOR.instances['#{locator}'].setData(#{content});
    $('textarea##{locator}').text(#{content});
  SCRIPT
end
