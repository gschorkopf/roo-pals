class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :user_name
      t.string :url
    end
  end
end
