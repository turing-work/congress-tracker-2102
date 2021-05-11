require 'rails_helper'

describe 'logging in' do 
    it 'as a registered user, I can log in with correct credentials' do 
       
        # and I see a welcome message with my username
        # and I should no longer see the link that says "I already have an account"
        # and I should no longer see the link that says "Register as a User"
        # and I should see a link that says "Log out"

        user = User.create(email: 'meg@test.com', password: 'ilovefoosball')
        
        visit root_path

        click_link "I already have an account"

        expect(current_path).to eq(login_path)
        
        fill_in :email, with: "meg@test.com"
        fill_in :password, with: "ilovefoosball"
        
        click_button "Log in"
        
        expect(current_path).to eq(root_path)
        expect(page).to have_content("Welcome, meg@test.com!")
        expect(page).to_not have_link("I already have an account")
        expect(page).to_not have_link("Sign Up to Be a User")
        expect(page).to have_link("Log out")
        
        click_link("Log out")
        
        expect(current_path).to eq(root_path)
        expect(page).to_not have_link("Log out")
        expect(page).to have_link("I already have an account")
        expect(page).to have_link("Sign Up to Be a User")
    end 

    it 'as a registered user, I cant log in with incorrect credentials' do 
        user = User.create(email: 'meg@test.com', password: 'ilovefoosball')
        
        visit root_path

        click_link "I already have an account"

        expect(current_path).to eq(login_path)
        
        fill_in :email, with: "meg@test.com"
        fill_in :password, with: "ilovesoccer"
        
        click_button "Log in"
        
        expect(current_path).to eq(login_path)
        expect(page).to have_content("Your email or password are incorrect")

    end 
end 