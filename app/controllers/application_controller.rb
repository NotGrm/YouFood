class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :fetch_menu, :init_order

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
    @all_categories = Category.all
  end

  def init_order
    session[:order] ||= Order.new
  end
end
