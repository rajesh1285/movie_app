Rails.application.routes.draw do
  

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  #root 'home#index'
  resources :home
  resources :movies do
	  	collection do
        get 'movies/detail' => 'movies#detail' 
	  		get 'search'
	  	end
  	resources :reviews
  end
  root 'movies#index'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
