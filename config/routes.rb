ProjectARhT::Application.routes.draw do

  devise_for :users, :path => 'user'
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  resources :users, :controller => "users" do
		post 'users/:id' => "users#update" 
		resource :clinic
		resources :client_sessions, :only => [:index]

	end
	
	resources :client_sessions

	namespace :api do
  	namespace :v1  do
  	  resources :tokens,:only => [:create, :destroy]
  	end
	end

	root :to => 'static#home'
end
