Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    namespace :v1 do
      post 'auth/login', to: 'auth#login'
      
      # Client routes
      resources :public_info, only: [:index]
      
      # Protected client routes
      resources :client_actions
      
      # Admin routes
      namespace :admin do
        resources :users
        resources :content_management
        # Add other admin resources
      end
    end
  end

  get '/example', to: 'example#index'
end