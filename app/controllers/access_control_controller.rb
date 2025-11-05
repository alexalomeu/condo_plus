require "ostruct"

class AccessControlController < ApplicationController
  layout "dashboard" 

  def profiles
    # Perfis falsos
    @profiles = [
      OpenStruct.new(id: 1, name: "Administrador do Sistema", is_administrator: true, is_active: true, permissions: { "users_view" => true, "users_edit" => true }),
      OpenStruct.new(id: 2, name: "Síndico", is_administrator: false, is_active: true, permissions: { "users_view" => true })
    ]

    # Perfil vazio para o modal
    @profile = OpenStruct.new(
      id: nil,
      name: "",
      is_administrator: false,
      is_active: true,
      permissions: {}
    )

    # 👇 Adiciona os métodos necessários para o Rails entender o objeto
    def @profile.to_model; self; end
    def @profile.model_name; ActiveModel::Name.new(OpenStruct, nil, "Profile"); end
    def @profile.persisted?; false; end

    # Recursos e permissões fictícias
    @resource_names = { "users" => "Usuários", "condos" => "Condomínios", "visitors" => "Visitantes" }
    @permissions_by_resource = {
      "users" => %w[view edit delete],
      "condos" => %w[view edit],
      "visitors" => %w[view]
    }
  end

  def index; end
  def administrators; end
  def assignments; end
end