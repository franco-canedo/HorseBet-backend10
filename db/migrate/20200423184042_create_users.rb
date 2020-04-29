class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :bio
      t.string :avatar
      t.integer :winnings, :default => 0
      t.float :deposit, :default => 0
      t.integer :number_wins, :default => 0

      t.timestamps
    end
  end
end
