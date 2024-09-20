class CreateArtists < ActiveRecord::Migration[7.1]
  def change
    create_table :artists do |t|
      t.string :name
      t.string :genre
      t.string :biography

      t.timestamps
    end
  end
end
