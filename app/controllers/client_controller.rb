class ClientController < ApplicationController
  before_filter :require_table_number, :fetch_menu

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

  private
  def current_order
    Order.find(session[:order_id])
  rescue ActiveRecord::RecordNotFound
    order = Order.create
    session[:order_id] = order.id
    order
  end
end