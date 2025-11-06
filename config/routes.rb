Rails.application.routes.draw do
  get 'condominiums/index'
  get 'condominiums/new'
  get 'condominiums/edit'
  get 'condominiums/show'
  get 'real_estates/index'
  get 'real_estates/new'
  get 'real_estates/create'
  get 'real_estates/edit'
  get 'real_estates/update'
  get 'real_estates/destroy'
  # Página inicial (login)
  root to: "sessions#new"

  # Sessões (login/logout)
  get  "sessions/new",    to: "sessions#new",    as: :new_session
  post "sessions",        to: "sessions#create", as: :sessions
  delete "logout",        to: "sessions#destroy", as: :logout

  # Dashboard principal
  get "dashboard", to: "dashboard#index", as: :dashboard

  # Configuração / Access Control
  get "access_control",                  to: "access_control#index",         as: :access_control
  get "access_control/profiles",         to: "access_control#profiles",      as: :profiles
  get "access_control/administrators",   to: "access_control#administrators",as: :administrators
  delete "access_control/administrators/:id", to: "access_control#delete_admin", as: :access_control_delete_admin
  get "access_control/assignments",      to: "access_control#assignments",   as: :assignments

  # Imobiliárias Parceiras
  get "real_estate", to: "real_estate#index", as: :real_estate

  # Condomínios
  get "condominiums", to: "condominiums#index", as: :condominiums

  # Síndicos
  get "managers", to: "managers#index", as: :managers

  # Mensageria
  get "chat", to: "chat#index", as: :chat

  # Monetização
  get "billing", to: "billing#index", as: :billing
    
  resources :real_estates do
    member do
      get :revenue
    end
  end

  resources :condominiums do
    patch :approve, on: :member
    patch :reject, on: :member
    get :revenue, on: :member
  end
end