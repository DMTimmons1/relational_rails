class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :city
      t.integer :rank
      t.string :conference
      t.boolean :has_won_championship
      t.timestamps
    end
  end
end
