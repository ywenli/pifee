class RemoveStatusFromWorks < ActiveRecord::Migration[6.0]
  def change
    remove_column :works, :status, :integer
  end
end
