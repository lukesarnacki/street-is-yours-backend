class AddLocationToIssues < ActiveRecord::Migration[5.0]
  def change
    add_column :issues, :location, :string
  end
end
