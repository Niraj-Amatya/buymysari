class ApplicationController < ActionController::Base

    
    before_action :configure_permitted_parameters, if: :devise_controller?
# fields to be filled when user is signing-up, signing-in or updating their profile through
#devise
protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :username, :address, :email, :password, :remember_me)}
        devise_parameter_sanitizer.permit(:sign_in) {|u| u.permit(:email, :password, :remember_me)}
        devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :username, :address, :about, :email, :password, :current_password, :remember_me)}
    end
end
