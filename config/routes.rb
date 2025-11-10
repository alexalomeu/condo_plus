Rails.application.routes.draw do

  # Página inicial (login)
  root to: "sessions#new"

  # Sessões (login/logout)
  get  "sessions/new",    to: "sessions#new",    as: :new_session
  post "sessions",        to: "sessions#create", as: :sessions
  delete "logout",        to: "sessions#destroy", as: :logout

  # Dashboard principal
  get "dashboard", to: "dashboard#index", as: :dashboard

  # Síndicos (Managers)
  resources :managers do
    member do
      patch :approve
      patch :reject
    end
  end

  # Imobiliárias Parceiras
  resources :real_estates do
    member do
      get :revenue
    end
  end

  # Condomínios
  resources :condominiums do
    patch :approve, on: :member
    patch :reject, on: :member
    get :revenue, on: :member
  end

  # Configuração / Access Control
  get "access_control",                  to: "access_control#index",          as: :access_control
  get "access_control/profiles",         to: "access_control#profiles",       as: :profiles
  get "access_control/administrators",   to: "access_control#administrators", as: :administrators
  delete "access_control/administrators/:id", to: "access_control#delete_admin", as: :access_control_delete_admin
  get "access_control/assignments",      to: "access_control#assignments",    as: :assignments

  # Mensageria
  get "chat", to: "chats#index", as: :chat

  # Monetização
  resources :revenues, only: [:index]
end
