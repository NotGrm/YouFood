class ClientController < ApplicationController
  before_filter :require_table_number

  def require_table_number
    if identified?
      @table_number = cookies[:table_number]
      @all_categories = Category.all
    else
      redirect_to welcome_configure_path
    end
  end

  def identified?
    !cookies[:table_number].blank?
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