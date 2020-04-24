class CreateUserHorses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_horses do |t|
      t.integer :user_id
      t.integer :horse_id

      t.timestamps
    end
  end
end
