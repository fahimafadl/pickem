class CreateGamesUsers < ActiveRecord::Migration
  def change
    create_table :games_users do |t|
      t.integer :user_id
      t.string :game_id
      t.integer :pick
      t.integer :result

      t.timestamps null: false
    end
  end
end
