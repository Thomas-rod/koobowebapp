Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :flats do
    resources :schedules, only: [:create, :new]
    resources :visits, only: [:new, :create]
  end
  resources :schedules, only: [:index, :update] do
    resources :visits, only: :update
  end
  resources :flows, only: :index
  get "flats/:id/edit_publication", to: "flats#edit_publication", as: :edit_publication
  get "flats/:id/recap_publication", to: "flats#recap_publication", as: :recap_publication
  patch "flats/:id/update_publication", to: "flats#update_publication", as: :update_publication
  patch "flats/:id/disable_publication", to: "flats#disable_publication", as: :disable_publication
end
