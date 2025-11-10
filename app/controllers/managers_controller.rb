class ManagersController < DashboardController
  before_action :set_manager, only: [:edit, :update, :destroy, :approve, :reject, :show]

  def index
    @managers = Manager.order(created_at: :desc)
    @manager = Manager.new
  end

  def create
    @manager = Manager.new(manager_params)
    if @manager.save
      flash[:notice] = "Síndico cadastrado com sucesso"
      redirect_to managers_path
    else
      flash[:alert] = @manager.errors.full_messages.to_sentence
      redirect_to managers_path
    end
  end

  def update
    if @manager.update(manager_params)
      flash[:notice] = "Síndico atualizado com sucesso"
      redirect_to managers_path
    else
      flash[:alert] = @manager.errors.full_messages.to_sentence
      redirect_to managers_path
    end
  end

  def destroy
    @manager.destroy
    flash[:notice] = "Síndico removido com sucesso"
    redirect_to managers_path
  end

  def approve
    @manager.update(status: "Aprovado")
    flash[:notice] = "Síndico aprovado com sucesso"
    redirect_to managers_path
  end

  def reject
    @manager.update(status: "Rejeitado")
    flash[:alert] = "Síndico rejeitado"
    redirect_to managers_path
  end

  private

  def set_manager
    @manager = Manager.find(params[:id])
  end

  def manager_params
    params.require(:manager).permit(:name, :cpf, :email, :phone, :condominium, :status)
  end
end