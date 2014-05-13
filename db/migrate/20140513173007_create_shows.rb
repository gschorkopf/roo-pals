class CreateShows < ActiveRecord::Migration
  def change
    create_table :shows do |t|
      t.string :artist_name
      t.time :starting_time
      t.time :ending_time
    end
  end
end
