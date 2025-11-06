class RealEstatesController < ApplicationController
  layout "dashboard" 
  before_action :set_real_estate, only: [:edit, :update, :destroy]

  def index
    @real_estates = RealEstate.order(:name).distinct
  end

  def new
    @real_estate = RealEstate.new
    @real_estate.responsibles.build
  end

  def create
    @real_estate = RealEstate.new(real_estate_params)
    if @real_estate.save
      redirect_to real_estates_path, notice: 'Imobiliária criada com sucesso.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @real_estate.update(real_estate_params)
      redirect_to real_estates_path, notice: 'Imobiliária atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @real_estate.destroy
    redirect_to real_estates_path, notice: 'Imobiliária removida com sucesso.'
  end

  def revenue
    @real_estate = RealEstate.find(params[:id])
    @condominiums = @real_estate.condominiums.includes(:revenues)
    @filtered_revenues = Revenue.joins(:condominium)
      .where(condominiums: { real_estate_id: @real_estate.id })
      .select(
        'condominiums.nome AS condominium_name',
        'revenues.unit',
        'revenues.negotiated_value',
        'revenues.monetization',
        'revenues.date'
      )
      .order('condominiums.nome, revenues.date')

    @total_negotiated   = @filtered_revenues.sum(&:negotiated_value)
    @total_monetization = @filtered_revenues.sum(&:monetization)
  end

  private

  def set_real_estate
    @real_estate = RealEstate.find(params[:id])
  end

  def real_estate_params
    params.require(:real_estate).permit(
      :name, :cnpj, :email, :phone,
      responsibles_attributes: [:id, :name, :email, :phone, :position, :_destroy]
    )
  end
end