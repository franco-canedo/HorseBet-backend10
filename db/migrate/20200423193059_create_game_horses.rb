class CreateGameHorses < ActiveRecord::Migration[6.0]
  def change
    create_table :game_horses do |t|
      t.integer :game_id
      t.integer :horse_id

      t.timestamps
    end
  end
end
