Ambiente::Application.routes.draw do

  get "plannings/new"

  get "plannings/create"

  get "plannings/index"

  get "plannings/show"

  get "plannings/destroy"

  get "plannings/edit"

  get "areas/index"

  get "areas/show"

  get "areas/edit"

  get "areas/create"

  get "areas/new"

  get "subareas/index"

  get "subareas/show"

  get "subareas/edit"

  get "subareas/create"

  get "subareas/new"

  get "locals/index"

  get "locals/show"

  get "locals/edit"

  get "locals/create"

  get "locals/new"

  get "systems/index"

  get "systems/show"

  get "systems/edit"

  get "systems/create"

  get "systems/new"

  get "systems/edit_price"

  get "systems/define"

  post "systems/define"

  get "subsystems/index"

  get "subsystems/show"

  get "subsystems/edit"

  get "subsystems/create"

  get "subsystems/new"

  get "subsubsystems/index"

  get "subsubsystems/show"

  get "subsubsystems/edit"

  get "subsubsystems/create"

  get "subsubsystems/destroy"

  get "enterprises/index"

  get "enterprises/show"

  get "enterprises/destroy"

  get "enterprises/edit"

  get "enterprises/create"

  get "enterprises/new"

  resources :programs do
    resources :enterprises
  end

  resources :enterprises do
    resources :systems
  end

  resources :subsubsystems

  resources :subsystems do
    resources :subsubsystems
  end

  resources :systems do
    resources :subsystems
  end

  resources :subareas do
    resources :locals
  end

  resources :areas do
    resources :subareas
  end

=begin
  get "program/index"

  get "program/show"

  get "program/new"

  get "program/edit"

  get "program/delete"

  post 'program/create'

  post 'program/new'
=end

  get "info/help"

  match "programs" => "programs#index"

  match "subsubsystems" => "subsubsystems#index"

  match "subsystems" => "subsystems#index"

  match "systems" => "systems#index"

  match "locals" => "locals#index"

  match "subareas" => "subareas#index"

  match "areas" => "areas#index"

  root :to => "programs#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
