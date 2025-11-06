require "ostruct"

class AccessControlController < ApplicationController
  layout "dashboard" 

    def index; end

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

  def administrators
    @administrators = [
      OpenStruct.new(id: 1, name: "João Silva", email: "joao@monetiza.com", role: "Super Admin"),
      OpenStruct.new(id: 2, name: "Maria Santos", email: "maria@monetiza.com", role: "Admin")
    ]

    # Cria um objeto "falso" que o Rails entende como model
    @admin = OpenStruct.new(id: nil, name: "", email: "", role: "Admin")

    # Define o método persisted? dentro da instância (necessário pro form_with)
    def @admin.persisted?
      false
    end
  end


  def delete_admin
    # aqui você pode adicionar lógica real, mas por enquanto só simula
    flash[:notice] = "Administrador removido com sucesso!"
    redirect_to administrators_path
  end
 
  def assignments
    # Mock de dados (sem banco de dados)
    @managers = [
      { id: 1, name: "Carlos Oliveira" },
      { id: 2, name: "Ana Paula Costa" },
      { id: 3, name: "Roberto Silva" }
    ]

    @real_estates = [
      { id: 1, name: "Imobiliária Prime" },
      { id: 2, name: "Imobiliária Top" }
    ]

    @condos = [
      { id: 1, name: "Residencial Jardim das Flores" },
      { id: 2, name: "Condomínio Vista Verde" },
      { id: 3, name: "Edifício Solar" }
    ]

    # Simulações de vínculos
    @manager_assignments = []
    @real_estate_assignments = []
  end
end