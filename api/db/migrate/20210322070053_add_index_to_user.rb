class AddIndexToUser < ActiveRecord::Migration[6.0]
  def change
    add_index :users, :url, :unique => true
  end
end
