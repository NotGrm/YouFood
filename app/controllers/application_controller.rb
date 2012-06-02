class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :fetch_menu

  def fetch_menu
    @categories = Category.all;
  end
end
