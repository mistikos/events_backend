Rails.application.routes.draw do

  scope constraints: { subdomain: 'manager'} do

    devise_for :users
    devise_for :admins, controllers: { registrations: "admins/registrations" }

    authenticated :admin do
      root :to => "events#index", as: :authenticated_root
    end

    unauthenticated :admin do
      root :to => "static_pages#home"
    end

    resources :clients, only: [:new, :create]
    resources :events do
      resources :participants, only: [:create, :new]
      resources :checklists, only: [:create, :new, :destroy]
    end
    resources :admins, :only => [:show]

  end



  #api definition
  namespace :api, defaults: { format: :json }, constraints: { subdomain: 'api' }, path: '/'  do
    scope module: :v1 do
    end
  end

end
