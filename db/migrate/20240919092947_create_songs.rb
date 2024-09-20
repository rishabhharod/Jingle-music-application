class CreateSongs < ActiveRecord::Migration[7.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :genre
      t.date :release_date
      t.references :artist, null: false, foreign_key: true
      t.string :lyrics
      t.float :Time_duration

      t.timestamps
    end
  end
end
