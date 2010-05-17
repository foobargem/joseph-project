class FeedsController < ApplicationController

  layout "standard"

  def index
    @feeds = paginate(Feed.where("parent_id IS NULL").order("created_at desc"))
  end

  def show
    @feed = Feed.where("id = ?", params[:id]).first
  end

end
