class CondominiumsController < ApplicationController
  before_action :set_condominium, only: [:show, :edit, :update, :destroy, :approve, :reject, :revenue]

  def index
    @condominiums = Condominium.includes(:revenues).all
  end

  def new
    @condominium = Condominium.new
  end

  def create
    @condominium = Condominium.new(condominium_params)
    if @condominium.save
      redirect_to condominiums_path, notice: "Condomínio criado com sucesso!"
    else
      render :new
    end
  end

  def edit; end

  def update
    if @condominium.update(condominium_params)
      redirect_to condominiums_path, notice: "Condomínio atualizado com sucesso!"
    else
      render :edit
    end
  end

  def destroy
    @condominium.destroy
    redirect_to condominiums_path, notice: "Condomínio removido com sucesso!"
  end

  def approve
    @condominium.update(status: "Aprovado")
    redirect_to condominiums_path, notice: "Condomínio aprovado!"
  end

  def reject
    @condominium.update(status: "Rejeitado")
    redirect_to condominiums_path, alert: "Condomínio rejeitado!"
  end

  def revenue
    # Aqui você pode mostrar receitas do condomínio
    @revenues = @condominium.revenues
  end

  private

  def set_condominium
    @condominium = Condominium.find(params[:id])
  end

  def condominium_params
    params.require(:condominium).permit(
      :real_estate_id, :nome, :unidades_por_torre, :nomes_torres, :tipo,
      :data_construcao, :area_total, :area_comum, :valor_condominio,
      :taxa_administrativa, :endereco, :numero, :bairro, :cidade, :estado,
      :cep, :latitude, :longitude, :piscina, :churrasqueira, :playground,
      :academia, :estacionamento_coberto, :estacionamento_descoberto,
      :portaria_24h, :elevadores, :email_administracao, :telefone_administracao,
      :status
    )
  end
end

