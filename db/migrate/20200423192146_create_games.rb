class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer :jackpot
      t.integer :minimum_bet
      t.string :winner
      t.integer :bets_placed, :default => 0
      t.boolean :active, :default => false
      t.boolean :joinable, :default => true

      t.timestamps
    end
  end
end
