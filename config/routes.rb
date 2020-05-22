Rails.application.routes.draw do

require "sidekiq/web"
  authenticate :user, lambda { |u| u.email == 'thomas@koobo.co' } do
    mount Sidekiq::Web => '/sidekiq'
  end

  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'

  #*------------------------------------*#
          #ROUTES USED FOR SPECIFIC
  #*------------------------------------*#
  get 'dashboard/', to: 'pages#dashboard'
  get 'search/', to: 'pages#search'
  post 'visits/', to: 'visits#create', as: :create_visit
  get 'pricing/', to: 'pages#pricing'
  get 'politique-confidentialite', to: 'pages#confidentialite'

  #*------------------------------------*#
          #ROUTES USED FOR MODEL
  #*------------------------------------*#
  resources :flats do
    resources :schedules, only: [:create, :new]
  end
  resources :schedules, only: [:index, :update] do
    resources :visits, only: :update
  end

  resources :records, only: [:create, :update, :destroy]
  resources :records, only: [:index] do
    resources :backers, only: [:create, :update]
  end
  resources :backers, only: [:destroy]

  resources :visits, only: [:index]
  resources :rentings, only: [:create, :edit, :update, :new, :index, :show]
  resources :renting_folders, only: [:update]
  resources :flows, only: [:index, :create]

  resources :documents, only: [:create, :update, :destroy]
  resources :backer_documents, only: [:destroy]
  resources :record_documents, only: [:destroy]

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


  #*------------------------------------*#
          #ROUTES USED FOR VISIT MODIFICATIONS
  #*------------------------------------*#
  patch "visits/:id/false", to: "visits#update_renting_visit_false", as: :visit_no_renting
  patch "visits/:id/true", to: "visits#update_renting_visit_true", as: :visit_create_renting
  patch "visits/:id", to: "visits#update_renting_visit_default", as: :visit_reset_renting
  #*------------------------------------*#
          #ROUTES USED RECORD MODIFICATIONS
  #*------------------------------------*#
  delete "record/:id/purge_document_record", to: "records#purge_document_record", as: :purge_document_record


  delete "backers/:backer_id/purge_document_backer", to: "backers#purge_document_backer", as: :purge_document_backer
end
