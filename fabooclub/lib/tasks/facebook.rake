namespace :facebook do

  namespace :crawl do

    task :previous => :environment do
      %W(
        http://graph.facebook.com/287407861237/feed?limit=25&until=2010-03-18T07%3A26%3A14%2B0000
        http://graph.facebook.com/287407861237/feed?limit=25&since=2010-03-18T07%3A06%3A04%2B0000
      ).each do |url|
        fu = FacebookBot::FeedUpdator.new(url)
        fu.process
      end
    end

    task :recent => :environment do
      fu = FacebookBot::FeedUpdator.new
      fu.process
    end

  end

end
