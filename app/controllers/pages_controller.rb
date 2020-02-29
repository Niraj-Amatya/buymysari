class PagesController < ApplicationController
  def home

  end

  def not_found
    render plain: "This page does not exist."
  end

end
