class HoboMigration2 < ActiveRecord::Migration
  def self.up
    rename_column :paginas, :video_file_name, :video_webm_file_name
    rename_column :paginas, :video_content_type, :video_webm_content_type
    rename_column :paginas, :video_file_size, :video_webm_file_size
    rename_column :paginas, :video_updated_at, :video_webm_updated_at
    add_column :paginas, :video_mp4_file_name, :string
    add_column :paginas, :video_mp4_content_type, :string
    add_column :paginas, :video_mp4_file_size, :integer
    add_column :paginas, :video_mp4_updated_at, :datetime
  end

  def self.down
    rename_column :paginas, :video_webm_file_name, :video_file_name
    rename_column :paginas, :video_webm_content_type, :video_content_type
    rename_column :paginas, :video_webm_file_size, :video_file_size
    rename_column :paginas, :video_webm_updated_at, :video_updated_at
    remove_column :paginas, :video_mp4_file_name
    remove_column :paginas, :video_mp4_content_type
    remove_column :paginas, :video_mp4_file_size
    remove_column :paginas, :video_mp4_updated_at
  end
end
