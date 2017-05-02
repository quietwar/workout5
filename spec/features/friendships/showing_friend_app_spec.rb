require "rails_helper"

RSpec.feature "Showing Friends apps" do
  before do
    @john =  User.create!(first_name: "John",
                          last_name: "Doe",
                          email: "john@example.com",
                          password: "password")

    @peter = User.create!(first_name: "Sarah",
                          last_name: "Anderson",
                          email: "sarah@example.com",
                          password: "password")

    @p1 = @john.projects.create!(app_name: "my app",
                                  coding: "ruby",
                                  start_date: Date.today)

    @p2 = @john.projects.create!(app_name: "my app",
                                  coding: "ruby",
                                  start_date: Date.today)

    login_as(@john)

  @following =Friendship.create(user: @john, friend: @sarah)
end

  scenario "if signed in" do
    visit "/"

    click_link "My Lab"
    click_link @sarah.full_name

    expect(page).to have_content(@sarah.full_name + "s Projects")
    expect(page).to have_content(@p2.app)
    expect(page).not_to have_css("div#chart")

    
    end

  end
