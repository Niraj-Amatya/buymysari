class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    # id = params[:id]
    # @userprofile = User.find(:id)
    @user = User.find(params[:id])
    @user_listings = @user.listings
    @users = User.all
  end

end
