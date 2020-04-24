class CreateHorses < ActiveRecord::Migration[6.0]
  def change
    create_table :horses do |t|
      t.string :name
      t.integer :speed

      t.timestamps
    end
  end
end
