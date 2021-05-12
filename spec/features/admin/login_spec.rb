require 'rails_helper' 

RSpec.describe 'Admin Login' do 
    it "I can log in as an admin and get to my admin dashboard" do
        admin = User.create(email: "superuser@awesome-site.com",
                        password: "super_secret_passw0rd",
                        role: 1)

        visit login_path
        fill_in :email, with: admin.email
        fill_in :password, with: admin.password
        click_button 'Log in'

        expect(current_path).to eq(admin_dashboard_path)
    end
    it "as a default a user, I see an error meessage when I try to go to admin dashboard" do
        user = User.create(email: "meg@test.com",
                        password: "test")

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit admin_dashboard_path

        expect(page).to have_content("You don't have access to this page.")
        expect(current_path).to eq(root_path)
    end
end 