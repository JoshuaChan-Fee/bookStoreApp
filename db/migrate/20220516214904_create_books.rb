class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :stock
      t.string :status
      t.belongs_to :store, null: false, foreign_key: true

      t.timestamps
    end
  end
end
