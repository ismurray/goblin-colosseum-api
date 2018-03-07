class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.boolean :over
      t.integer :score

      t.timestamps
    end
  end
end
