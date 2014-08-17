require "rails_helper"


feature "user can go to homepage" do
  scenario "user visits homepage and can log in" do
    visit "/"

    fill_in "Email", :with => "user@example.com"
    fill_in "Password", :with => "password"

    click_on "Login"

    expect(page).to have_content "user@example.com"

    click_on "Logout"

    click_on "About"

    expect(page).to have_content "About Taskly"
  end
    scenario "user can add task lists" do

      visit "/"

      fill_in "Email", :with => "user@example.com"
      fill_in "Password", :with => "password"

      click_on "Login"

      expect(page).to have_content "user@example.com"

      click_on "Add Task List"

      fill_in "Task", :with => "Do Homework"

      click_on "Add Task"

      expect(page).to have_content "Do Homework"

      click_on "+Add Task"

      fill_in "Description", :with => "work on jQuery"

      click_on "Add Task"

      expect(page).to have_content "work on jQuery"

    end

end