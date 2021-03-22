class RenameNameColumnToUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :name, :url
  end
end
