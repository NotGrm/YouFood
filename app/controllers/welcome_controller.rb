class WelcomeController < ApplicationController
  skip_before_filter :require_table_number, :only => [:configure, :set_table_number]
  def index
  end

  def about
  end

  def configure
    render :layout => "no_menu"
  end

  def set_table_number
    if is_valid? params[:table_number]
      cookies[:table_number] = params[:table_number]
      redirect_to welcome_index_path
    else
      cookies[:table_number] = nil
      @error = "La table n'existe pas"
      render :action => "configure", :layout => "no_menu"
    end
  end

  def is_valid?(table_number)
    (table_number =~ /^[0-9]+$/) && (Table.exists? :id => table_number)
  end
end
