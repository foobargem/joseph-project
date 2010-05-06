class FeedsController < ApplicationController

  layout "standard"

  def index
    @feeds = Feed.where("parent_id IS NULL").order("id asc")
  end

end
