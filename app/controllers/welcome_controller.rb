class WelcomeController < ApplicationController
  before_filter :require_table_number, :fetch_menu, :except => [:configure]
  def index
  end

  def about
  end

  def configure
    if params[:table_number] =~ /^[0-9]+$/
      if Table.exists? :id => params[:table_number]
        cookies[:table_number] = params[:table_number]
        redirect_to welcome_index_path
      else
        cookies[:table_number] = nil
        @error = "La table n'existe pas"
      end
    end
  end
end
