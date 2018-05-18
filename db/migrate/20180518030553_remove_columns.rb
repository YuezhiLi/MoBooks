class RemoveColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :username
    remove_column :users, :address
  end
end
