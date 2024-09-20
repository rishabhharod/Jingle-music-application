class CreateUserPlaylists < ActiveRecord::Migration[7.1]
  def change
    create_table :user_playlists do |t|
      t.references :song, null: false, foreign_key: true
      t.references :wishlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
