class SessionsController < ApplicationController
  def new
  end

  def create
    redirect_to dashboard_path, notice: "Login realizado com sucesso!"
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Sessão encerrada com sucesso."
  end
end
