class ChangeImagesInIssues < ActiveRecord::Migration[5.0]
  def change
    remove_column :issues, :images
    add_column :issues, :image, :string
    add_column :issues, :image_file_md5, :string
    add_column :issues, :image_file_size, :integer
  end
end
