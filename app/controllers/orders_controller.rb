class OrdersController < ApplicationController
  def show
    @order = session[:order]
  end
end
