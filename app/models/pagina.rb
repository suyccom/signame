class Pagina < ActiveRecord::Base

  hobo_model # Don't put anything above this

  fields do
    url               :string, :required, :unique
    timestamps
  end
  attr_accessible :url

  has_many :solicituds, :accessible => true

  has_attached_file :video_webm, 
    :styles => { 
      :small => ["200x250", :jpg ], 
      :thumbnail => ["100x100#", :jpg ] 
    }, 
    :whiny => false,
    :default_style => :small,
    :path => "#{Rails.root}/public/videos/:style/:id.:extension",
    :url => "/videos/:style/:id.:extension"
  has_attached_file :video_mp4, 
    :styles => { 
      :small => ["640x480", :jpg ], 
      :thumbnail => ["100x100#", :jpg ] 
    }, 
    :whiny => false,
    :default_style => :small,
    :path => "#{Rails.root}/public/videos/:style/:id.:extension",
    :url => "/videos/:style/:id.:extension"

  def signada?
    self.video_webm_file_size.nil? ? false : true
  end
  
  def color_urgencia
    signada? ? '#65CC50;' : '#FBF821;'
  end

  after_create :notificar_ils
  def notificar_ils
    PaginaMailer.notificar_ils(self).deliver
  end
  
  def convertir_webm_a_mp4
    system("HandBrakeCLI -Z Universal -i '#{self.video_webm.path(:original)}' -o temp.mp4")
    self.update_attribute(:video_mp4, File.open("temp.mp4"))
    system("rm temp.mp4")
  end
  
  scope :signada,   lambda { where("video_webm_file_size IS NOT ?", nil)}
  scope :pendiente, lambda { where("video_webm_file_size IS ?", nil)}

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
