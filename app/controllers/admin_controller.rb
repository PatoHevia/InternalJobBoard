class AdminController < ApplicationController
  before_action :authenticate_user! # Asegura que el usuario esté autenticado
  before_action :ensure_admin       # Asegura que el usuario sea administrador

  def dashboard
    # Lógica para el panel de administración
  end

  private

  def ensure_admin
    redirect_to root_path, alert: "No tienes acceso a esta sección." unless current_user.admin?
  end
end
