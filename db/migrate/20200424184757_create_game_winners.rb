class CreateGameWinners < ActiveRecord::Migration[6.0]
  def change
    create_table :game_winners do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :moneyWon
      t.timestamps
    end
  end
end
