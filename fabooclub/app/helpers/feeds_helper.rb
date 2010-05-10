module FeedsHelper

  def cyword_date_format(date)
    date.strftime("%Y%m%d%H%M%S")
  end

  def cyworld_body(feed)
    html = break_line(feed.message)
    html += "<br /><br />"
    html += "<a href=\"#{feed.link}\">from facebook(Joseph-project)</a>"
    html
  end

  def break_line(text)
    text.gsub("\n", "<br />")
  end

end
