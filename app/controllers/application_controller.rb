class ApplicationController < ActionController::Base
    def current_user 
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end 

    def current_admin?
        current_user && !current_user.admin?
    end 

    helper_method :current_user, :current_admin?
end
