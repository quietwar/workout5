require "rails_helper"

RSpec.feature "Creating Project" do
  before do
    @john = User.create!(email: "john@example.com",
                         password: "password")
    login_as(@john)

    visit "/"

    click_link "My Lab"
    click_link "New App"
    expect(page).to have_link("Back")
  end

  scenario "with valid inputs" do
    fill_in "Coding", with: "Primary Language"
    fill_in "Project Details",  with: "Description"
    fill_in "Start date",  with: "2017-08-26"
    click_button "Create Project"

    expect(page).to have_content("Project has been created")

    project = Project.last
    expect(current_path).to eq(user_exercise_path(@john, project))
    expect(project.user_id).to eq (@john.id)
  end

  scenario "with invalid inputs" do

   fill_in "Coding", with: "Primary Language"
   fill_in "Project Details",  with: "Description"
   fill_in "Start date",  with: "2017-08-26"
   click_button "Create Project"

   expect(page).to have_content("Project has not been created")
   expect(page).to have_content("Coding has to have a language")
   expect(page).to have_content("Project details can't be blank")
   expect(page).to have_content("Start date can't be blank")
 end

 end
