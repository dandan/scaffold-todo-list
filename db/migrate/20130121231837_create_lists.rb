class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.text :description
      t.references :category

      t.timestamps
    end
    add_index :lists, :category_id
  end
end
