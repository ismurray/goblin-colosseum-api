class AddDefaultValueToGamesColumns < ActiveRecord::Migration[5.1]
  def up
    change_column :games, :over, :boolean, default: false
    change_column :games, :score, :integer, default: 0
    change_column :games, :round, :integer, default: 1
  end

  def down
    change_column :games, :over, :boolean, default: nil
    change_column :games, :score, :integer, default: nil
    change_column :games, :round, :integer, default: nil
  end
end
