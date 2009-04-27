ActionController::Routing::Routes.draw do |map|
  map.resources :users

  map.resource :session
  
  
  map.flex '/matlabulchifai', :controller => "flex", :action => "index"
  
  
  map.patient_search '/patients/search.:format', :controller => "patients", :action => "find"  
  map.allergy_search '/patient_allergies/search.:format', :controller => "patient_allergies", :action => "find"
  map.vaccination_search '/patient_vaccination/search.:format', :controller => "patient_vaccination", :action => "find"
  map.medication_search '/patient_medication/search.:format', :controller => "patient_medication", :action => "find"
  map.condtion_search '/patient_visits/search.:format', :controller => "patient_visits", :action => "find"
  
  map.connect '/patients/:patient_id/patient_physicals/:action', 
              :controller => 'patient_physicals', :action => :action
              
  map.resources :patients do |patients|
  	patients.resources :patient_alerts
    patients.resources :patient_notes
    patients.resources :patient_visits
    patients.resources :patient_medications
    patients.resources :patient_vaccinations
    patients.resources :patient_allergies
    patients.resources :patient_physicals
  end

  map.resources :patient_alerts
  
  map.resources :patient_allergies
  
  map.resources :patient_vaccinations
  
  map.resources :patient_medications
  
  map.resources :patient_visits
  
  map.resources :patient_notes

  map.resources :visit_types
  
  map.resources :medications

  map.resources :conditions

  map.resources :vaccinations

  map.resources :allergies

  map.resources :doctors

  map.resources :patients

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

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
  map.root :controller => "patients"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing the them or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
