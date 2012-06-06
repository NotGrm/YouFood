class ApplicationController < ActionController::Base
  protect_from_forgery

  

  def require_table_number
    unless identified?
      redirect_to welcome_configure_path
    end
    @table_number = cookies[:table_number]
  end

  def identified?
    !cookies[:table_number].blank?
  end

  def fetch_menu
    @categories = Category.all
  end
end
