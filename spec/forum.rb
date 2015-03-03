require './helper.rb'
require './content/forum/forum.rb'

feature "Forum" do
  scenario "User should see all topics" do
    visit "#{ROOT_URL}/forum/"
    verify_content($forum_content)
  end
end
