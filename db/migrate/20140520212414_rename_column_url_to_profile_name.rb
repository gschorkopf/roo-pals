class RenameColumnUrlToProfileName < ActiveRecord::Migration
  def change
    rename_column :schedules, :url, :profile_name
  end
end
