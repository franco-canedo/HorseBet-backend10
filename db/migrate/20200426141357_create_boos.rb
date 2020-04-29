class CreateBoos < ActiveRecord::Migration[6.0]
  def change
    create_table :boos do |t|
      t.integer :game_id
      t.integer :horse_id
      t.integer :user_id
      t.timestamps
    end
  end
end
