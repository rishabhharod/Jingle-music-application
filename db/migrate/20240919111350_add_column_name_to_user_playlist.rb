class AddColumnNameToUserPlaylist < ActiveRecord::Migration[7.1]
  def change
    add_column :user_playlists, :name, :string
  end
end
