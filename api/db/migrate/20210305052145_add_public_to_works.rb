class AddPublicToWorks < ActiveRecord::Migration[6.0]
  def change
    add_column :works, :is_public, :boolean, default: false, null: false
  end
end
