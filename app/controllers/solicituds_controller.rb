# encoding: utf-8
class SolicitudsController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def create
    # Comprobar si el email recibido ya existe en las solicituds
    if Solicitud.count(:all, :conditions=> ['email_solicitante = ? AND pagina_id = ?',params[:email_solicitante],params[:pagina_id]]) > 0
      flash[:notice] = "Lo siento ya has pedido esta página, te avisaremos por email cuando este terminada."
    else
      Solicitud.create(:email_solicitante => params[:email_solicitante], :pagina_id => params[:pagina_id])
      flash[:notice] = "La solicitud se ha creado, te avisaremos por email cuando este terminada."
    end
    redirect_to :back
  end 
end
