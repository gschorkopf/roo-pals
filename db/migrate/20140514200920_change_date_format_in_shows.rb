class ChangeDateFormatInShows < ActiveRecord::Migration
  def change
    remove_column :shows, :starting_time, :time
    remove_column :shows, :ending_time, :time
    add_column :shows, :starting_at, :datetime
    add_column :shows, :ending_at, :datetime
  end
end
