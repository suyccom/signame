Signame::Application.routes.draw do
  match ENV['RAILS_RELATIVE_URL_ROOT'] => 'front#index' if ENV['RAILS_RELATIVE_URL_ROOT']
  root :controller => 'paginas', :action => 'new'
  match 'users/:id/reset_password_from_email/:key' => 'users#reset_password', :as => 'reset_password_from_email'
  match 'users/:id/accept_invitation_from_email/:key' => 'users#accept_invitation', :as => 'accept_invitation_from_email'
  match 'users/:id/activate_from_email/:key' => 'users#activate', :as => 'activate_from_email'
  match 'search' => 'front#search', :as => 'site_search'
  match 'semaforo' => 'front#semaforo'
  match 'integracion' => 'front#integracion'
  match 'cola_trabajos' => 'paginas#index'
  match 'conoce_nuestro_trabajo' => 'paginas#index', :conoce_nuestro_trabajo => true
  match 'caracteristicas_y_servicios' => 'front#caracteristicas_y_servicios'
end

