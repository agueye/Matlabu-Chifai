ActionController::Routing::Routes.draw do |map|
  map.resources :categories
  map.resources :recipes

  map.root :controller => "categories"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
