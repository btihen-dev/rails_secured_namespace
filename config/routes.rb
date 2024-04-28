Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, :skip => [:registrations]
  # as :user do
  #   get "/sign_in" => "devise/sessions#new" # custom path to login/sign_in
  #   get "/sign_up" => "devise/registrations#new", as: "new_user_registration" # custom path to sign_up/registration
  #   get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
  #   put 'users' => 'devise/registrations#update', :as => 'user_registration'
  # end

  namespace :admin do
    resources :users
    resources :contacts
  end
  resources :contacts
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "contacts#new"
end
