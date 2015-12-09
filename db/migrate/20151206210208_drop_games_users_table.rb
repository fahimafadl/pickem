class DropGamesUsersTable < ActiveRecord::Migration

  def change
    create_table :picks do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :pick
      t.integer :result

      t.timestamps null: false
    end
  end
end
