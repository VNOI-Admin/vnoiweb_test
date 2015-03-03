require './helper.rb'
require './content/users/login.rb'
require './content/users/logout.rb'

feature "User" do
  scenario "Basic login and logout" do
    visit "#{ROOT_URL}/main"

    verify_content($login_content)
    login('admin', 'admin')
    verify_content($logout_content)
  end
end
