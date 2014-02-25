Ambiente::Application.routes.draw  do

	devise_for :users do
		get '/users/sign_out' => 'devise/sessions#destroy'
	end

	get "album/view_album"
	get "album/delete_image"
	post "album/view_album"

	resources :plannings
	
	resources :images

	resources :programs, :has_many => :medias

	resources :programs do
		get "report"
	end

	resources :enterprises do
		get "report"
	end

	resources :areas do
		get "report"
	end

	resources :systems do
		get "report"
	end

	resources :subsystems do
		get "report"
	end

	get "baselines_controller/index"

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

	get "subsubsystems/data_for_chart"

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
		resources :areas
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
		resources :systems
	end

	resources :systems do
		resources :plannings
	end

	resources :subsystems do
		resources :plannings
	end

	resources :subsubsystems do
		resources :plannings
	end

	resources :plannings do
		resources :periods
	end

	resources :periods

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

end