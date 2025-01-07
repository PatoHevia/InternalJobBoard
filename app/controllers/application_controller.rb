class ApplicationController < ActionController::Base
  # Solo permite navegadores modernos compatibles con tecnologías específicas.
  allow_browser versions: :modern

  # Redirige después de iniciar sesión
  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_dashboard_path # Cambia esto a la ruta para administradores si aplica
    else
      job_offers_path # Cambia esto a la ruta deseada para usuarios normales
    end
  end

  # Redirige después de cerrar sesión
  def after_sign_out_path_for(resource_or_scope)
    root_path # Redirige a la página principal
  end
end
