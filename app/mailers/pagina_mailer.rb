# encoding: utf-8

class PaginaMailer < ActionMailer::Base
  default from: "alertas@unoycero.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pagina_mailer.solicitud.subject
  #
  def notificar_solicitud(pagina)
    @pagina = pagina
    ultimo_email = @pagina.solicituds.last.email_solicitante
    destinatario = Rails.env.production? ? ultimo_email : DEVEL_EMAIL
    mail(
      :to => destinatario,
      :subject => "[signame] Confirmación de solicitud de signado de página web",
      :bcc => 'tecnicos@unoycero.com' #Solo se envia si no se repite en :to
    )
  end
  def notificar_ils(pagina)
    @pagina = pagina
    destinatario = Rails.env.production? ? ILS_EMAIL : DEVEL_EMAIL
    mail(
      :to => destinatario, 
      :subject => "[signame] Nuevo trabajo",
      :bcc => 'tecnicos@unoycero.com' #Solo se envia si no se repite en :to
    )
  end
  def terminado(pagina)
    @pagina = pagina
    emails = []
    solicitudes = @pagina.solicituds
    for s in solicitudes
      emails << s.email_solicitante.to_s
    end    
    destinatario = Rails.env.production? ? emails : DEVEL_EMAIL
    mail(
      :to => destinatario,
      :subject => "[signame] Página web adaptada",
      :bcc => destinatario #Solo se envia si no se repite en :to
    )
  end
end
