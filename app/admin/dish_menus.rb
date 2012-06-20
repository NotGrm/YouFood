ActiveAdmin.register DishMenu do
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
      @dish_menu = DishMenu.new(params[:menu])
      dishes_string = params[:listDishOfMenu]

      @dish_menu.dishes = Dish.get_all_by_id(dishes_string)

      respond_to do |format|
        if @dish_menu.save
          format.html { redirect_to admin_dish_menus_path, notice: dishes_string }
        end
      end
    end
  end
end
