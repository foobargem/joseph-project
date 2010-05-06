module FacebookBot

  class MetadataUpdator

    def initialize
      url = "http://graph.facebook.com/287407861237?metadata=1"
      @doc = Nokogiri::HTML(open(url))

      @metadata = JSON.parse(@doc.content)
    end

    def create_or_update_to_db

      pm = PageMetadata.where("fb_id = ?", @metadata['id']).first
      if pm.nil?

        urls = @metadata['metadata']['connections']

        pm = PageMetadata.create(
          :fb_id => @metadata['id'],
          :name => @metadata['name'],
          :picture => @metadata['picture'],
          :link => @metadata['link'],
          :category => @metadata['category'],
          :founded => @metadata['founded'],
          :company_overview => @metadata['company_overview'],
          :mission => @metadata['mission'],
          :fan_count => @metadata['fan_count'],

          :feed_url => urls['feed'],
          :posts_url => urls['posts'],
          :tagged_url => urls['tagged'],
          :statuses_url => urls['statuses'],
          :links_url => urls['links'],
          :notes_url => urls['notes'],
          :photos_url => urls['photos'],
          :albums_url => urls['albums'],
          :events_url => urls['events'],
          :videos_url => urls['videos']
        )
      end

    end

  end

end
