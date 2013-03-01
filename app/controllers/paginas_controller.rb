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



end
