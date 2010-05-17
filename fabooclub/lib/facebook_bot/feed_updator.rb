module FacebookBot

  class FeedUpdator

    attr_reader :feeds

    def initialize(url = "http://graph.facebook.com/287407861237/feed")
      @doc = Nokogiri::HTML(open(url))

      @feeds = JSON.parse(@doc.content)
    end

    def process

      @feeds['data'].each do |data|

        fd = create_feed(parse_for_feed(data))

        unless fd.nil?

          unless data['comments'].nil?
            data['comments']['data'].each do |data|
              data['parent_id'] = fd.id
              create_feed(parse_for_feed(data))
            end
          end

        end

      end

    end


    private

      def create_feed(data)
        feed = Feed.where("fb_id = ?", data[:fb_id]).first
        if feed.nil?

          unless data[:picture].blank?
            pc = PhotoCrawler.new(data[:fb_id], data[:link])

            if pc.response
              data[:orig_picture] = pc.origin_picture_url
              data[:orig_picture_width] = pc.width
              data[:orig_picture_height] = pc.height
            end
          end

          fd = Feed.new(data)
          fd.save!
          fd
        else
          nil
        end
      end


      def parse_for_feed(data = {})

        feed = {}

        feed[:parent_id] = data['parent_id']

        feed[:fb_id] = data['id']

        feed[:from_id] = data['from']['id']
        feed[:from_name] = data['from']['name']
        feed[:from_category] = data['from']['category']

        unless data['to'].nil?
          tos = data['to']['data']
          unless tos.nil?
            feed[:to_id] = tos[0]['id']
            feed[:to_name] = tos[0]['name']
            feed[:to_category] = tos[0]['category']
          end
        end

        feed[:message] = data['message']

        feed[:picture] = data['picture']

        feed[:link] = data['link']
        feed[:name] = data['name']
        feed[:icon] = data['icon']
        feed[:caption] = data['caption']
        feed[:likes] = data['likes'].to_i

        feed[:created_at] = data['created_time'].to_time

        unless data['updated_time'].nil?
          feed[:updated_at] = data['updated_time'].to_time
        else
          feed[:updated_at] = feed[:created_at]
        end

        feed
      end

  end

end
