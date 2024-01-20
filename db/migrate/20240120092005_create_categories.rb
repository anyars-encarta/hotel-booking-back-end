class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.string :image
      t.integer :number_of_rooms, default: 0
      t.integer :number_reserved, default: 0

      t.timestamps
    end
  end
end
