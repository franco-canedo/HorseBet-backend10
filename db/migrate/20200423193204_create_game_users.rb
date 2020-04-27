class CreateGameUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :game_users do |t|
      t.integer :game_id
      t.integer :user_id
      t.integer :extra_bet
      t.integer :total_bet

      t.timestamps
    end
  end
end
