require 'rails_helper'

RSpec.describe 'Registration' do 
    # Then I should see a welcome message with my username
    # and my user details have been saved in the database.
    it "I can create a new user and save that user to the database" do 
        visit root_path

        click_link "Sign Up to Be a User"

        expect(current_path).to eq("/register")

        fill_in :user_email, with: "meg@test.com"
        fill_in :user_password, with: "ilovefoosball"

        click_button "Register"

        expect(current_path).to eq(root_path)
        new_user = User.last

        expect(page).to have_content("Welcome, meg@test.com!")
        expect(new_user.email).to eq('meg@test.com')
    end 
end 