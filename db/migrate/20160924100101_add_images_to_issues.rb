class AddImagesToIssues < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :images, :json
  end
end
