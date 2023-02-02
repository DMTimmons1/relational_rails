class CreatePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :age
      t.integer :height_in_cm
      t.string :position
      t.boolean :is_a_rookie
      t.timestamps
    end
  end
end
