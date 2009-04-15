ActionController::Routing::Routes.draw do |map|
  map.resources :coordinators

  map.resources :schools,
                :member => [:assign_coordinator, :remove_coordinator]

  map.resources :student_professional_profiles

  map.resources :contacts,
                :member => [:add_new]

  map.resources :job_records

  map.resources :student_reports

  map.resources :student_performances

  map.resources :password_resets

  map.resources :students,
                :has_one => [:professional_profile],
                :member => {:edit_contacts => :get,
                            :save_contacts => :put}

  map.resources :coordinator_trimestrial_report_activities

  map.resources :terms

  map.resources :partners

  map.resources :activities

  map.resources :languages

  map.resources :course_student_profiles

  map.resources :courses,
                :has_one => [:first_week_methodology,
                             :rotate_methodology,
                             :final_report],
                :has_many => [:project_team_members,
                              :students,
                              :coordinator_trimestrial_reports,
                              :educator_reports,
                              :student_reports],
                :member => {:language_choice => :get,
                            :educator_report_review => :get}

  map.resources :courses,
                :member => [:dashboard, :deadlines_dashboard]

  map.resource :account, :controller => "users"
  map.resources :users, :collection => {:verify_email => :post}

  map.resource :user_session
  map.root :controller => "user_sessions", :action => "new"

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :produfirst_weekcts

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  #map.root :controller => "courses"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
end

