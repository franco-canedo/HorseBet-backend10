class CreateGameUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :game_users do |t|
      t.integer :game_id
      t.integer :user_id
      t.float :extra_bet
      t.float :total_bet
      t.boolean :bettable, :default => false

      t.timestamps
    end
  end
end
