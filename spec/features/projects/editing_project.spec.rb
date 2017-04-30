require "rails_helper"

RSpec.feature "Creating Project" do
  before do
    @john = User.create!(first_name: "john", last_name: "Doe", email: "john@example.com",
                         password: "password")
    login_as(@john)

    @owner_project = @owner.projects.create!(coding: "language",
                                                  app: "My body building activity",
                                                  start_date: Date.today)

      login_as(@owner)
    end

    scenario "with valid data succeeds" do
      visit '/'

      click_link "My Lab"

      path = "/users/#{@owner.id}/projects/#{@owner_project.id}/edit"
      link = "a[href=\'#{path}\']"
      find(link).click

      fill_in "Coding", with: "java"
      click_button "Update Exercise"

      expect(page).to have_content("Exercise has been updated")
      expect(page).to have_content("java")
      expect(page).not_to have_content("language")
    end

  end
