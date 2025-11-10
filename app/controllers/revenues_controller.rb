class RevenuesController < DashboardController
  def index
    # Exibe todas as receitas com seus relacionamentos
    @revenues = Revenue.includes(:condominium).order(created_at: :desc)
  end
end
