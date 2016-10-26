class FrontController < ApplicationController

  hobo_controller

  def index; end

  def summary
    if !current_user.administrator?
      redirect_to user_login_path
    end
  end
  
  def semaforo
    pagina = Pagina.find_by_url(request.referer)
    if pagina && pagina.signada?
      color = 'verde'
    else
      color = 'amarillo'
    end
    send_file "app/assets/images/#{color}.png", :disposition => 'inline', :type => "image/png"
  end

  def search
    if params[:query]
      site_search(params[:query])
    end
  end
  
  def integracion; end

  def caracteristicas_y_servicios; end

end
