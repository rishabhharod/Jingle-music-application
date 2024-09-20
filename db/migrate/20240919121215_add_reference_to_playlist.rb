class AddReferenceToPlaylist < ActiveRecord::Migration[7.1]
  def change
    add_reference :playlists, :collection, null: false, foreign_key: true
  end
end
