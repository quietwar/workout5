require "rails_helper"

RSpec.feature "Deleting Project" do
  before do
    @owner = User.create!(first_name: "John", last_name: "Doe", email: "owner@example.com", password: "password")

    @owner_project = @owner.projects.create!(coding: "language",
                                                app: "My body building activity",
                                                start_date: Date.today)

    login_as(@owner)
  end

  scenario do
    visit "/"

    click_link "My Lab"

    path = "/users/#{@owner.id}/projects/#{@owner_project.id}"
    link = "//a[contains(@href,\'#{path}\') and .//text()='Destroy']"

    find(:xpath, link).click

    expect(page).to have_content("Project has been deleted")
  end

end
