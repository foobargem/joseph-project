class CreatePageMetadatas < ActiveRecord::Migration
  def self.up
    create_table :page_metadatas do |t|
      t.string :fb_id
      t.string :name
      t.string :picture
      t.string :link
      t.string :category
      t.string :founded
      t.text :company_overview
      t.text :mission
      t.integer :fan_count, :default => 0

      t.string :feed_url
      t.string :posts_url
      t.string :tagged_url
      t.string :statuses_url
      t.string :links_url
      t.string :notes_url
      t.string :photos_url
      t.string :albums_url
      t.string :events_url
      t.string :videos_url

      t.timestamps
    end
  end

  def self.down
    drop_table :page_metadatas
  end
end
