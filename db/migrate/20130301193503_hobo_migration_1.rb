class HoboMigration1 < ActiveRecord::Migration
  def self.up
    create_table :paginas do |t|
      t.string   :url
      t.string   :email_solicitante
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :video_file_name
      t.string   :video_content_type
      t.integer  :video_file_size
      t.datetime :video_updated_at
    end
  end

  def self.down
    drop_table :paginas
  end
end
