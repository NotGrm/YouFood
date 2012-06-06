class ApplicationController < ActionController::Base
  protect_from_forgery

  

  def require_table_number
    unless identified?
      redirect_to welcome_configure_path
    end
  end

  def identified?
    !!cookies[:table_number]
  end

  def fetch_menu
    @categories = Category.all
  end
end
