Rails.application.routes.draw do
  # Defines the root path route ("/")
  root "pages#home"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { confirmations: 'users/confirmations' }

  resources :birthday_buddies
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
