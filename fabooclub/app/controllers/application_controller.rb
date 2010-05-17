class ApplicationController < ActionController::Base
  protect_from_forgery

  def paginate(c)
    c.paginate(:page => params[:page], :per_page => 15)
  end
end
