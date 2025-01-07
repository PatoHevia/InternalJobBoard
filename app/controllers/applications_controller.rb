class ApplicationsController < ApplicationController
  before_action :authenticate_user!        # Asegura que el usuario esté autenticado
  before_action :authorize_user!, only: [:create] # Solo permite que usuarios regulares se postulen
  before_action :set_application, only: %i[show edit update destroy]

  # GET /applications or /applications.json
  def index
    @applications = Application.all
  end

  # GET /applications/1 or /applications/1.json
  def show
  end

  # GET /applications/new
  def new
    @application = Application.new
  end

  # GET /applications/1/edit
  def edit
  end

  # POST /applications or /applications.json
  def create
    # Encontramos la oferta de trabajo correspondiente
    @job_offer = JobOffer.find(params[:job_offer_id])

    # Creamos la nueva aplicación asociada al usuario actual y la oferta de trabajo
    @application = current_user.applications.build(application_params)
    @application.job_offer = @job_offer  # Asociamos la oferta de trabajo a la aplicación

    respond_to do |format|
      if @application.save
        # Llamar al mailer después de guardar la postulación
        UserMailer.new_application_notification(@application).deliver_later

        format.html { redirect_to job_offers_path, notice: "Postulación enviada exitosamente." }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applications/1 or /applications/1.json
  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: "Postulación actualizada exitosamente." }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applications/1 or /applications/1.json
  def destroy
    @application.destroy!

    respond_to do |format|
      format.html { redirect_to applications_path, status: :see_other, notice: "Postulación eliminada exitosamente." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_application
      @application = Application.find(params[:id])
    end

    # Solo permite que usuarios regulares (no admins) se postulen
    def authorize_user!
      unless current_user.user?  # Esto supone que el modelo User tiene un método `user?` para verificar si es un usuario regular
        redirect_to root_path, alert: "No tienes permiso para realizar esta acción."
      end
    end

    # Solo permite una lista de parámetros confiables
    def application_params
      params.require(:application).permit(:cover_letter) # Ahora solo necesitamos el parámetro cover_letter, ya que job_offer_id se pasa en la URL
    end
end
