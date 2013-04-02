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
    paginas = Pagina.pendiente
    paginas = Pagina.signada if params[:paginas_signadas] == true
    @title = "Cola de trabajos"
    @title = "Páginas signadas" if params[:paginas_signadas] == true
    hobo_index paginas.apply_scopes(
      :order_by => parse_sort_param(:url, :email_solicitante, :created_at)
    )
  end

  def update
    hobo_update do
      unless @pagina.video_file_size.nil?
        PaginaMailer.terminado(@pagina).deliver
      end
    end
  end
end
