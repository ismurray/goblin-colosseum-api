class AddPlayerStateToGames < ActiveRecord::Migration[5.1]
  def change
    add_column :games, :player_state, :text
  end
end
