# encoding: utf-8

class PaginaMailer < ActionMailer::Base
  default from: "alertas@unoycero.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pagina_mailer.solicitud.subject
  #
  def solicitud(pagina)
    @pagina = pagina
    destinatario = Rails.env.production? ? pagina.email_solicitante : 'tecnicos@unoycero.com'
    mail(
      :to => destinatario, 
      :subject => "Confirmación de solicitud de signado de página web",
      :bcc => 'tecnicos@unoycero.com'
      )
  end
end
