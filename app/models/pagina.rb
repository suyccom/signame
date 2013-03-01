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
      :default_style => :small,
      :path => "#{Rails.root}/public/videos/:style/:id.:extension",
      :url => "/videos/:style/:id.:extension"

  # --- Permissions --- #

  def create_permitted?
    acting_user.administrator?
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
