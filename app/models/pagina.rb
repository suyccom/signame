class Pagina < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    url               :string
    email_solicitante :email_address
    timestamps
  end
  attr_accessible :url, :email_solicitante, :video
  
  
  has_attached_file :video, 
      :styles => { 
        :small => ["200x250", :jpg ], 
        :thumbnail => ["100x100#", :jpg ] 
      }, 
      :whiny => false,
      :default_style => :small,
      :path => "#{Rails.root}/public/videos/:style/:id.:extension",
      :url => "/videos/:style/:id.:extension"


  after_create :notificar_nueva_solicitud
  def notificar_nueva_solicitud
    PaginaMailer.solicitud(self).deliver
  end

  # --- Permissions --- #

  def create_permitted?
    true
  end

  def update_permitted?
    true
  end

  def destroy_permitted?
    true
  end

  def view_permitted?(field)
    true
  end

end
