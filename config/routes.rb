Rails.application.routes.draw do
  root to: "home#index"

  get "home/index"
  get "home/credits"

  resources :roads
  resources :transports
  resources :places
  resources :structures
  resources :reasons
  resources :veichles
  resources :refunds do
    collection do
      get :print
      get :print_list
    end
  end
  resources :refund_closures do
    collection do
      get :search
    end
  end
  resources :holidays

  devise_for :users, skip: [:registrations]
  as :user do
    get "users/edit" => "devise/registrations#edit", :as => "edit_user_registration"
    put "users" => "devise/registrations#update", :as => "user_registration"
  end

  mount RailsAdmin::Engine => "/admin", as: "rails_admin"
end
