class UsersController < ApplicationController

  # this is for user profile page
  # @users will have all the user id
  def index
    @users = User.all
  end

  # for specific user profile details

  def show 
    @user = User.find(params[:id])
    @user_listings = @user.listings
    @users = User.all
  end

end
