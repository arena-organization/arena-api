Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do 
    mount_devise_token_auth_for 'User', at: 'auth'
    
    namespace :v1 do 
      namespace :clients do 
        resources :dashboard, only: :index
      end

      namespace :managers do 
        resources :dashboard, only: :index
        resources :matches, only: :index
      end
    end

    get :address, to: 'address#show'
  end
end