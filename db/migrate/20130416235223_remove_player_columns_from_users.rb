class RemovePlayerColumnsFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :white_player_id
    remove_column :users, :black_player_id
  end

  def down
  end
end
