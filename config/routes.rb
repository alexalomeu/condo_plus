Rails.application.routes.draw do
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
end