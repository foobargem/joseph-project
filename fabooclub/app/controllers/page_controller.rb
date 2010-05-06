class PageController < ApplicationController

  layout "standard"

  def index
    @fb_page = PageMetadata.first
  end

end
