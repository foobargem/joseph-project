class AddPictureSizeFiledToFeeds < ActiveRecord::Migration
  def self.up
    add_column :feeds, :orig_picture, :string
    add_column :feeds, :orig_picture_width, :integer, :default => 0
    add_column :feeds, :orig_picture_height, :integer, :default => 0
  end

  def self.down
    remove_column :feeds, :orig_picture
    remove_column :feeds, :orig_picture_width
    remove_column :feeds, :orig_picture_height
  end
end
