class ChangeSoundcloudTrackId < ActiveRecord::Migration[5.0]
  def change
    rename_column :pieces, :soundcloud_track_id, :youtube_url
  end
end
