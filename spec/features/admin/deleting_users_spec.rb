require 'spec_helper'

feature 'Deleting users' do
  let!(:admin_user) { FactoryGirl.create(:admin_user) }
  let!(:user) { FactoryGirl.create(:user) }
  
  before do
    sign_in_as!(admin_user)
    visit '/'
    click_link 'Admin'
    click_link 'Users'
  end

  scenario "Deleting a user" do
    click_link user.email
    click_link 'Delete User'

    expect(page).to have_content("User has been deleted.")

    within("#users") do
      expect(page).to_not have_content(user.email)
    end
  end

  scenario "Users cannot delete themselves" do
    click_link admin_user.email
    click_link "Delete User"

    expect(page).to have_content("You cannot delete yourself!")
  end
end


















































require 'spec_helper'
feature "Creating Users" do
let!(:admin) { FactoryGirl.create(:admin_user) }
before do
sign_in_as!(admin)
visit '/'
click_link "Admin"
click_link "Users"
click_link "New User"
end
scenario 'Creating a new user' do
fill_in "Email", with: "newbie@example.com"
fill_in "Password", with: "password"
click_button "Create User"
expect(page).to have_content("User has been created.")
end
end