class RemoveColumnFromUserPlayist < ActiveRecord::Migration[7.1]
  def change
    remove_column :user_playlists, :name, :string
  end
end
