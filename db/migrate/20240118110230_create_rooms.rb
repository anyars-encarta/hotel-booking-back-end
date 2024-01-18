class CreateRooms < ActiveRecord::Migration[7.1]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :room_type
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
