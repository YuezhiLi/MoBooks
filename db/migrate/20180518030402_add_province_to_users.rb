class AddProvinceToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :province, :string
  end
end
