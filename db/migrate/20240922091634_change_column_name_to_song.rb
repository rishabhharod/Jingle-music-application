class ChangeColumnNameToSong < ActiveRecord::Migration[7.1]
  def change
    rename_column :songs, :Time_duration, :time_duration
  end
end
