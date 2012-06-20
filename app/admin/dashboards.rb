ActiveAdmin::Dashboards.build do

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  section "Last Orders",:if => Proc.new { current_admin_user.user_is_administrator? } do
    table_for Order.order("created_at desc").last(10) do
      column :created_at do |order|  
        link_to order.completed_at.to_formatted_s(:long), admin_order_path(order)  
      end  
      
      column :table do |order|
        order.table_number
      end
      column :total_order_price do |order|
        number_to_currency order.total_order_price
      end
    end  
    strong { link_to "View All Orders", admin_orders_path } 
  end

  section "Cook orders",:if => Proc.new { current_admin_user.user_is_cook? } do
    puts "Hello Cook"
    table_for Order.order("completed_at desc").limit(10) do
      column :created_at do |order|  
        link_to order.completed_at.to_formatted_s(:long), admin_order_path(order)  
      end  
      
      column :table do |order|
        order.table_number
      end
      column :total_order_price do |order|
        number_to_currency order.total_order_price
      end
    end  
    strong { link_to "View All Orders", admin_orders_path } 
  end

  section "Waiter orders", :if => Proc.new { current_admin_user.user_is_waiter? } do
    puts "Hello Waiter"
    table_for Order.order("completed_at desc").limit(10) do
      column :created_at do |order|  
        link_to order.completed_at.to_formatted_s(:long), admin_order_path(order)  
      end  
      
      column :table do |order|
        order.table_number
      end
      column :total_order_price do |order|
        number_to_currency order.total_order_price
      end
    end  
    strong { link_to "View All Orders", admin_orders_path } 
  end

  section "Categories Statistics",:if => Proc.new { current_admin_user.user_is_administrator? } do

    categories_count = Order.categories_count
    div do
      image_tag Gchart.pie( :theme => :keynote, 
              :labels => categories_count.keys, 
              :data => categories_count.values)
    end
  end

  section "Restaurants Statistics",:if => Proc.new { current_admin_user.user_is_administrator? } do

    restaurants_sum = Order.restaurants_sum
    div do
      image_tag Gchart.bar( :theme => :pastel, 
              :labels => restaurants_sum.keys, 
              :data => restaurants_sum.values,
              :bar_width_and_spacing => '25,6')
    end
  end


  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  #   section "Recent Posts" do
  #     ul do
  #       Post.recent(5).collect do |post|
  #         li link_to(post.title, admin_post_path(post))
  #       end
  #     end
  #   end
  
  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
  
  # == Conditionally Display
  # Provide a method name or Proc object to conditionally render a section at run time.
  #
  # section "Membership Summary", :if => :memberships_enabled?
  # section "Membership Summary", :if => Proc.new { current_admin_user.account.memberships.any? }

end
