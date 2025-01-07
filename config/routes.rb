Rails.application.routes.draw do
  # Configuración de Devise para autenticación, deshabilitando el registro público
  devise_for :users, skip: [:registrations]

  # Ruta de la página principal
  root "pages#home"

  # Recursos básicos para las funcionalidades principales
  resources :job_offers do
    resources :applications, only: [:create, :destroy] # Relación anidada para aplicaciones
  end

  # Solo permite listar y mostrar usuarios
  resources :users, only: [:index, :show, :new, :create, :edit, :update]

  # Ruta para el panel de administración
  get "admin_dashboard", to: "admin#dashboard", as: :admin_dashboard

  # Ruta de salud para monitoreo de la aplicación
  get "up", to: "rails/health#show", as: :rails_health_check

  # Rutas dinámicas para Progressive Web App (PWA)
  get "service-worker", to: "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest", to: "rails/pwa#manifest", as: :pwa_manifest
end
