class CreateWins < ActiveRecord::Migration[6.0]
  def change
    create_table :wins do |t|
      t.integer :money
     

      t.timestamps
    end
  end
end
