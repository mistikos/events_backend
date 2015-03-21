Rails.application.routes.draw do

  scope constraints: { subdomain: 'manager'} do

    resources :users, only: [:index, :create, :new]

    devise_for :users, :skip => [:registrations, :sessions]

    as :user do
      get "/login" => "devise/sessions#new", :as => :new_user_session
      post "/login" => "devise/sessions#create", :as => :user_session
      delete "/logout" => "devise/sessions#destroy", :as => :destroy_user_session
    end

    devise_for :admins, controllers: { registrations: "admins/registrations" }

    devise_scope :admin do
      authenticated :admin do
        root 'events#index', as: :authenticated_root
      end

      unauthenticated do
        root 'devise/sessions#new', as: :unauthenticated_root
      end
    end

    resources :clients, only: [:new, :create, :index]

    resources :events do
      get :past, on: :collection
      resources :participants, only: [:create, :new]
      resources :event_receptionists, only: [:create, :new]
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
