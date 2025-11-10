class RealEstatesController < DashboardController
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

 def edit
    @real_estate = RealEstate.find(params[:id])
    @real_estate.responsibles.build if @real_estate.responsibles.empty?
  end


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
    @condominiums = Condominium.where(real_estate_id: @real_estate.id)

    # Inicia o escopo base
    revenues_scope = Revenue.joins(:condominium)
                            .where(condominiums: { real_estate_id: @real_estate.id })

    # 🔹 Filtro por condomínio
    if params[:condominium].present? && params[:condominium] != "all"
      revenues_scope = revenues_scope.where(condominiums: { nome: params[:condominium] })
    end

    # 🔹 Filtro por data
    if params[:start_date].present?
      revenues_scope = revenues_scope.where("revenues.date >= ?", params[:start_date].to_date)
    end

    if params[:end_date].present?
      revenues_scope = revenues_scope.where("revenues.date <= ?", params[:end_date].to_date)
    end

    # 🔹 Ordenação e seleção de campos
    @filtered_revenues = revenues_scope
      .select(
        "condominiums.nome AS condominium_name",
        "revenues.unit",
        "revenues.negotiated_value",
        "revenues.monetization",
        "revenues.date"
      )
      .order("condominiums.nome, revenues.date")

    # 🔹 Totais calculados com base nos filtros
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