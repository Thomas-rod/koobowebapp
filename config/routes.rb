Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :flats
  resources :schedules, only: [:index, :update, :create] do
    resources :visits, only: :update
  end
  resources :documents, only: :index
end
