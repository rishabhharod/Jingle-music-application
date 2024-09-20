class CreatePlaylists < ActiveRecord::Migration[7.1]
  def change
    create_table :playlists do |t|
      t.string :title
      t.string :description
      t.references :song, null: false, foreign_key: true

      t.timestamps
    end
  end
end
