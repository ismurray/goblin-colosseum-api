class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.boolean :over, null: false
      t.integer :score

      t.timestamps
    end
  end
end
