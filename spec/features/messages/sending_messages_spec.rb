require "rails_helper"

RSpec.feature "Showing Friends apps" do
  before do
    @john =  User.create!(first_name: "John", last_name: "Doe", email: "john@example.com", password: "password")
    @sarah = User.create!(first_name: "Sarah", last_name: "Anderson", email: "sarah@example.com", password: "password")
    @henry =  User.create!(first_name: "henry", last_name: "Flynn", email: "henry@example.com", password: "password")

     @room_name = @john.full_name + '-' + @john.last_name
     @room = Room.create!(name: @room_name, user_id: @john.id)

     login_as(@john)

     friendship.create(user: @sarah, friend: @john)
     friendship.create(user: @henry, friend: @john)
   end

   scenario "to followers shows in chatroom window" do
     visit "/"

     click_link "My Lab"
     expect(page).to have_content(@room_name)

     fill_in "message-field", with: "Sup"
     click_button "Post"

     expect(page).to have_content("Sup")

     within("#followers") do

       expect(page).to have_link(@sarah.full_name)
       expect(page).to have_link(@henry.full_name)
     end
   end
 end
