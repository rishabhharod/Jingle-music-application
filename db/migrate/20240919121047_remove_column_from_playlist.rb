class RemoveColumnFromPlaylist < ActiveRecord::Migration[7.1]
  def change
    remove_column :playlists, :title, :string
    remove_column :playlists, :description, :string
  end
end
