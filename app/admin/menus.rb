ActiveAdmin.register Menu do

  show do |menu|
    attributes_table do
      row :title

    end

    table_for menu.dishes do
      column :name
    end

  end


  form :partial => "form"

  controller do

    def create
      @menu = Menu.new(params[:menu])
      dishes_string = params[:listDishOfMenu]

      @menu.dishes = Dish.get_all_by_id(dishes_string)

      respond_to do |format|
        if @menu.save
          format.html { redirect_to admin_menus_path, notice: dishes_string }
        end
      end


    end
  end

end
