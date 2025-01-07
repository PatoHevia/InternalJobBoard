class UserMailer < ApplicationMailer
    default from: 'noreply@example.com'
  
    def new_application_notification(application)
      @application = application
      @admin = User.find_by(email: "esteban@example.com") # Cambia por el correo del administrador
      mail(to: @admin.email, subject: "Nueva postulación para #{@application.job_offer.title}")
    end
  end
  