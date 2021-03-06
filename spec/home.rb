require './helper.rb'
require './content/home.rb'
require './content/users/login.rb'

feature "Homepage" do
  scenario "Go to homepage and look around" do
    visit "#{ROOT_URL}/main"

    verify_content($home_content)
    verify_content($login_content)
  end
end
