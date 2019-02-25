Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/register', to: "registrations#create"
      post '/login', to: "sessions#create"
      resources :users, except: :index
      resources :observations
      resources :species, only: [:index, :show]
    end
  end
end
