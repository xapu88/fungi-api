Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/register', to: "registrations#create"
      post '/login', to: "sessions#create"
      resources :users, except: :index
      resources :observations do
        resources :comments
        collection do
          get 'search'
        end
      end
      resources :species do
        collection do
          get 'search'
        end
      end
      resources :habitats
      resources :habitat_categories
      resources :substrates
      resources :substrate_categories
      resources :floral_species
    end
  end
end
