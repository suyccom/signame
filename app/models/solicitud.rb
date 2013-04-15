class Solicitud < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    email_solicitante :email_address
    timestamps
  end
  belongs_to :pagina

  after_create :notificar_solicitud
  def notificar_solicitud
    PaginaMailer.notificar_solicitud(self.pagina).deliver
  end
  # --- Permissions --- #

  def create_permitted?
    true
  end

  def update_permitted?
    acting_user.administrator?
  end

  def destroy_permitted?
    acting_user.administrator?
  end

  def view_permitted?(field)
    true
  end

end
