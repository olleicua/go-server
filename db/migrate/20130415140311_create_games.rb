class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.text :moves
      t.text :chat

      t.timestamps
    end
  end
end
