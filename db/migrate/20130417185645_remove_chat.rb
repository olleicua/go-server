class RemoveChat < ActiveRecord::Migration
  def up
    remove_column :games, :chat
  end

  def down
  end
end
