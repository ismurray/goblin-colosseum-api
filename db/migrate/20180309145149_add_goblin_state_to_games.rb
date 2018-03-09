class AddGoblinStateToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :goblin_state, :text
  end
end
