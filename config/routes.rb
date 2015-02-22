Rails.application.routes.draw do

  devise_for :admins, controllers: { registrations: "admins/registrations" }
  resources :clients, only: [:new, :create]
  resources :events do
    resources :participants, only: [:create, :new]
    resources :checklists, only: [:create, :new, :destroy]
  end
  resources :admins, :only => [:show]
  root :to => "static_pages#home"
end