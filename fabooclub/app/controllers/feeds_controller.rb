class FeedsController < ApplicationController

  layout "standard"

  def index
    @feeds = Feed.where("parent_id IS NULL").order("id asc")
  end

  def show
    @feed = Feed.where("id = ?", params[:id]).first
  end

end
