class Admin::BaseController < ApplicationController 
    before_action :current_admin

    def current_admin 
        if current_admin?
            flash[:error] = "You don't have access to this page."
            redirect_to root_path
        end 
    end 
end 