class CreateFeeds < ActiveRecord::Migration
  def self.up
    create_table :feeds do |t|
      t.string :fb_id

      t.string :from_id
      t.string :from_name
      t.string :from_category

      t.string :to_id
      t.string :to_name
      t.string :to_category

      t.text :message

      t.string :picture
      t.string :link
      t.string :name
      t.string :icon
      t.string :caption
      t.integer :likes

      t.integer :parent_id

      t.timestamps
    end
  end

  def self.down
    drop_table :feeds
  end
end
