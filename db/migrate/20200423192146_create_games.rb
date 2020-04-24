class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :jackpot
      t.integer :minimum_bet
      t.string :winner

      t.timestamps
    end
  end
end
