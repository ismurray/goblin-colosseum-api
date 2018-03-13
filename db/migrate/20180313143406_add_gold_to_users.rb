class AddGoldToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :gold, :integer, default: 0
  end
end
