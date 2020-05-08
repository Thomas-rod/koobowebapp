Rails.application.routes.draw do

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  #*------------------------------------*#
          #ROUTES USED FOR SPECIFIC
  #*------------------------------------*#
  get 'dashboard/', to: 'pages#dashboard'
  get 'search/', to: 'pages#search'
  get 'pricing/', to: 'pages#pricing'
  get 'politique-confidentialite', to: 'pages#confidentialite'

  #*------------------------------------*#
          #ROUTES USED FOR MODEL
  #*------------------------------------*#
  resources :flats do
    resources :schedules, only: [:create, :new]
    resources :visits, only: [:new, :create]
  end
  resources :schedules, only: [:index, :update] do
    resources :visits, only: :update
  end

  resources :visits, only: [:index]
  resources :rentings, only: [:create, :edit, :update, :new, :index, :show]
  resources :flows, only: [:index, :create]

  #*------------------------------------*#
          #ROUTES USED FLAT MODIFICATIONS
  #*------------------------------------*#

  get "flats/:id/edit_publication", to: "flats#edit_publication", as: :edit_publication
  get "flats/:id/recap_publication", to: "flats#recap_publication", as: :recap_publication
  patch "flats/:id/update_publication", to: "flats#update_publication", as: :update_publication
  patch "flats/:id/disable_publication", to: "flats#disable_publication", as: :disable_publication
  post "flats/:id/upload_document", to: "flats#upload_document", as: :upload_document
  delete "flats/:id/purge_document", to: "flats#purge_document", as: :purge_document

  #*------------------------------------*#
          #ROUTES USED FOR USERS MODIFICATIONS
  #*------------------------------------*#
  patch "users/:id", to: "application#update_user_renter", as: :update_user_renter
end
