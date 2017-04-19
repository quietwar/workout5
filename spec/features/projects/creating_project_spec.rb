require "rails_helper"

RSpec.feature "Creating Project" do
  before do
    @john = User.create(email: "john@example.com",
                         password: "password")
    login_as(@john)
  end

  scenario "with valid inputs" do
    visit "/"

    click_link "My Lab"
    click_link "New Project"
    expect(page).to have_link("Back")

    fill_in "Coding", with: "Primary Language"
    fill_in "Project Details",  with: "Description"
    fill_in "Start date",  with: "2017-08-26"
    click_button "Create Project"

    expect(page).to have_content("Project has been created")
    project = Project.last
    expect(current_path).to eq(user_project_path(@john, project))
    expect(project.user_id).to eq(@john.id)
  end
  
end
