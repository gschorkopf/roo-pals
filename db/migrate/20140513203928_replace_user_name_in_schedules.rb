class ReplaceUserNameInSchedules < ActiveRecord::Migration
  def change
    remove_column :schedules, :user_name, :string
    add_column :schedules, :user_id, :integer
    add_index :schedules, :user_id
  end
end
