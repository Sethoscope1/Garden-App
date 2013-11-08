GardenApp::Application.routes.draw do

  resource :session

  resources :users do
    resources :gardens, only: [:index]
  end

  resources :gardens do
    resources :lists, only: [:new, :index] do
      resources :crops, only: [:new, :index]
      resources :notes, only: [:new, :index] do
        resources :comments, only: [:new, :index]
      end
    end
  end

  resources :notifications
  
  resources :garden_memberships

  resources :crops, only: [:create, :update, :show, :new] do
    resources :notes, only: [:index]
  end

  resources :lists, only: [:create, :show, :update]

  resources :notes, only: [:create, :new, :show, :edit, :update, :destroy] do
    member do
      put "toggle_flag"
    end
  end

  resources :comments, only: [:create, :destroy, :edit]

  root to: redirect("/session/new")
  
  match '/', to: "session#new"

end
