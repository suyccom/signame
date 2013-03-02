# encoding: UTF-8
class PaginasController < ApplicationController

  hobo_model_controller

  auto_actions :all

  def new
    @pagina = this
    hobo_new do
      if @pagina.url.blank? 
        @pagina.url = request.referer
      end
    end
  end

  def show
    hobo_show do
      flash[:notice] = "Muchas gracias por su solicitud, te avisamos por email en cuanto esté disponible"
    end
  end

end
