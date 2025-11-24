Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "pages#home"
  get "about", to: "pages#about"

  get "contact", to: "pages#contact"
  # also accept /pages/contact to avoid routing errors from older links/tools
  get "pages/contact", to: "pages#contact"
  get "products", to: "pages#products"

  namespace :api do
    namespace :v1 do
      # GET /api/v1/production_images
      get "production_images", to: "images#index"
    end
  end
  # root "posts#index"
end
