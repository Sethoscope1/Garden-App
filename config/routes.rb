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

  resources :crops, only: [:create, :update, :show, :new] do
    resources :notes, only: [:index]
  end

  resources :lists, only: [:create, :show]

  resources :notes, only: [:create, :new, :show, :edit, :update, :destroy]

  resources :comments, only: [:create, :destroy, :edit]

  root to: "users#index"

end
