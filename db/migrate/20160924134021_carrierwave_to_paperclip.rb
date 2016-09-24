class CarrierwaveToPaperclip < ActiveRecord::Migration[5.0]
  def change
    remove_column :issues, :image, :string
    remove_column :issues, :image_file_size, :integer
    remove_column :issues, :image_file_md5, :string
    add_attachment :issues, :image
    #add_column :issues, :image_updated_at, :timestamp
  end
end
