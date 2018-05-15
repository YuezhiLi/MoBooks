class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :open_id
      t.string :name
      t.string :address
      t.string :username
      t.string :avatar

      t.timestamps
    end
  end
end
