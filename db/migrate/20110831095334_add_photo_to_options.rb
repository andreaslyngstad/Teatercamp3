class AddPhotoToOptions < ActiveRecord::Migration
  def self.up
    add_column :options, :camp_photo_file_name, :string
    add_column :options, :camp_photo_content_type, :string
    add_column :options, :camp_photo_file_size, :integer
    add_column :options, :camp_photo_updated_at, :datetime
    add_column :options, :blogg_photo_file_name, :string
    add_column :options, :blogg_photo_content_type, :string
    add_column :options, :blogg_photo_file_size, :integer
    add_column :options, :blogg_photo_updated_at, :datetime
  end

  def self.down
    remove_column :options, :camp_photo_file_name
    remove_column :options, :camp_photo_content_type
    remove_column :options, :camp_photo_file_size
    remove_column :options, :camp_photo_updated_at
    remove_column :options, :blogg_photo_file_name
    remove_column :options, :blogg_photo_content_type
    remove_column :options, :blogg_photo_file_size
    remove_column :options, :blogg_photo_updated_at
    

  end
end
