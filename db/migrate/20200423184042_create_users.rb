class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.string :password_digest
      t.string :bio
      t.string :avatar
      t.integer :winnings
      t.integer :deposit
      t.integer :number_wins

      t.timestamps
    end
  end
end
