class ChangeNameToNicknameinUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :name, :nickName
  end
end
