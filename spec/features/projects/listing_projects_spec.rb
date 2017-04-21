require "rails_helper"

RSpec.feature "Listing Project" do
  before do
    @john =  User.create(first_name: "John", last_name: "Doe", email: "john@hiddengeniusproject.org", password: "password")
    @sarah = User.create(first_name: "Sarah", last_name: "Anderson", email: "sarah@hiddengeniusproject.org", password: "password")

    login_as(@john)

    @e1 = @john.exercises.create(duration_in_min: 20,
                                  projecct: "",
                                  start_date: Date.today)

    @e2 = @john.exercises.create(duration_in_min: 55,
                                  project: "",
                                  start_date: 2.days.ago)

    @following = Friendship.create(user: @john, friend: @sarah)

    # @e3 = @john.exercises.create(duration_in_min: 35,
    #                               workout: "On treadmill",
    #                               workout_date: 8.days.ago)
  end

  scenario "shows user's projects for last 7 days" do
    visit '/'

    click_link "My Lab"

    expect(page).to have_content(@e1.duration_in_min)
    expect(page).to have_content(@e1.workout)
    expect(page).to have_content(@e1.workout_date)

    expect(page).to have_content(@e2.duration_in_min)
    expect(page).to have_content(@e2.workout)
    expect(page).to have_content(@e2.workout_date)

    # expect(page).not_to have_content(@e3.duration_in_min)
    # expect(page).not_to have_content(@e3.workout)
    # expect(page).not_to have_content(@e3.workout_date)

    visit "/"

    click_link 'My Lsb'

    expect(page).to have_content('No Projects Yet')
  end

  scenario "shows a list of user's friends" do
    visit "/"

    click_link "My Lab"
    expect(page).to have_content("My Friends")
    expect(page).to have_link(@sarah.full_name)
    expect(page).to have_link("Unfollow")
  end

end
