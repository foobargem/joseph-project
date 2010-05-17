class AddIndexToFeeds < ActiveRecord::Migration
  def self.up
    add_index :feeds, :created_at
    add_index :feeds, :fb_id
  end

  def self.down
    remove_index :feeds, :created_at
    remove_index :feeds, :fb_id
  end
end
