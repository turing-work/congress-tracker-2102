class SessionsController < ApplicationController 
    def new 
    end 

    def create 
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            flash[:info] = "Welcome, #{user.email}!"
            if user.admin?
                redirect_to admin_dashboard_path
            elsif user.default?
                redirect_to root_path
            end 
        else 
            flash[:error] = "Your email or password are incorrect"
            render :new
        end 
    end 

    def destroy 
        session[:user_id] = nil
        redirect_to root_path
    end 
end 