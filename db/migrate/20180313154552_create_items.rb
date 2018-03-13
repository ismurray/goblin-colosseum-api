class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.boolean :consumable, default: false, null: false
      t.text :name, null: false
      t.integer :cost, default: 100, null: false
      t.text :description

      t.timestamps
    end
  end
end
