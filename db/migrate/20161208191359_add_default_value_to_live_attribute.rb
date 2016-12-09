class AddDefaultValueToLiveAttribute < ActiveRecord::Migration
  def change
    remove_column :albums, :live
    add_column :albums, :live_album, :boolean, default: false
    change_column :albums, :band_id, :integer, null: false
  end
end
