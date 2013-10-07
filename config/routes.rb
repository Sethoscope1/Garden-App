GardenApp::Application.routes.draw do

  resource :session

  resources :users do
    resources :gardens, only: [:index]
  end

  resources :gardens do
    resources :crops, only: [:show, :new]
  end

  resources :crops, only: [:create] do
    resources :notes, only: [:index]
  end

  resources :notes, only: [:create, :new, :show, :edit, :destroy]

  root to: "users#index"

end
