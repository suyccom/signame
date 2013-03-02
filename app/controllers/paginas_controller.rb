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

  def index
    hobo_index Pagina.apply_scopes(
      :order_by => parse_sort_param(:url, :email_solicitante, :created_at))
  end

end
