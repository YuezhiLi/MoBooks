class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :book, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :borrowed, default: true

      t.timestamps
    end
  end
end
