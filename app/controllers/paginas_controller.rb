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

  def index
    # Por defecto ordenamos por orden cronológico de creación.
    if (!params[:sort])
      params[:sort] = 'created_at'
    end
    hobo_index Pagina.apply_scopes(
      :order_by => parse_sort_param(:url, :email_solicitante, :created_at)
    )
  end

  def show
    hobo_show do
      flash[:notice] = "Muchas gracias por su solicitud, te avisamos por email en cuanto esté disponible"
    end
  end

  def edit
    hobo_edit do
      unless @pagina.video_file_size.nil?
        PaginaMailer.terminado(@pagina).deliver
      end
    end
  end

end
