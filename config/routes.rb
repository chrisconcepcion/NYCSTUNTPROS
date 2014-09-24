StuntRails::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  root 'stunt_professionals#index'
  get 'register', to: 'users#new'
  resources :users, only: [:create, :edit, :update] do
		collection do
			resources :profiles, only: [:show, :edit, :update]
		end
	end
  get 'login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/reset_password', to: "reset_password#new"
  resources :reset_password, only: [:create]
  get "/update_password/:reset_password_token", to: "update_password#new", as: "update_password"
  resources :update_password, only: [:create]
  get "/invalid_token", to: "invalid_token#index"
	get "/reset_password_confirmation", to: "reset_password_confirmation#index"
	resources :stunt_coordinator, only: [:index]
	resources :male_stunt_actor, only: [:index] do
		collection do
      get 'search', to: 'male_stunt_actor#search', as: 'search'
			match 'advanced_search', to: 'male_stunt_actor#advanced_search', via: [:get, :post]
    end
	end
	resources :female_stunt_actor, only: [:index] do
		collection do
      get 'search', to: 'female_stunt_actor#search', as: 'search'
			match 'advanced_search', to: 'female_stunt_actor#advanced_search', via: [:get, :post]
    end
	end
	
	resources :credits, only: [:index, :update, :create, :destroy, :update]
	

end
