# encoding: UTF-8
class PaginasController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def new
    @pagina = Pagina.find(:first, :conditions => ['url = ?', request.referer])
    if @pagina != nil 
      redirect_to @pagina
    else
      @pagina = this
      hobo_new do
        if @pagina.url.blank? 
          @pagina.url = request.referer
        end
      end
    end
  end

  def create
    hobo_create do
      Solicitud.create(:email_solicitante => params[:email_solicitante], :pagina_id => @this.id)
    end
  end

  def index
    # Mostrar solo si el usuario ha hecho login.
    if current_user.signed_up? || params[:conoce_nuestro_trabajo] == true
      paginas = params[:conoce_nuestro_trabajo].blank? ? Pagina.pendiente : Pagina.signada
      @title = params[:conoce_nuestro_trabajo].blank? ? "Cola de trabajos" : "Conoce nuestro trabajo"
      # Por defecto ordenamos por orden cronológico de creación.
      if (!params[:sort])
        params[:sort] = 'created_at'
      end
      hobo_index paginas.apply_scopes(
        :order_by => parse_sort_param(:url, :created_at)
      )
    else
      redirect_to user_login_path
    end
  end

  def update
    hobo_update do
      if @pagina.signada?
        @pagina.convertir_webm_a_mp4
        PaginaMailer.terminado(@pagina).deliver
      end
    end
  end
end
