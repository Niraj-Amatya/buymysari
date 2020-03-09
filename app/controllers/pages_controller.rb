class PagesController < ApplicationController

  # welcome page for the app
  def home

  end

  # when routes does not match 
  def not_found
    render plain: "This page does not exist."
  end

end
