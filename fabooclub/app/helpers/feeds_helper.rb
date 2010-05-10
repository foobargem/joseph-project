module FeedsHelper

  def cyword_date_format(date)
    date.strftime("%Y%m%d%H%M%S")
  end

  def cyworld_subject(feed)
    if feed.message.blank?
      "no subject"
    else
      truncate(feed.message, 30, "...")
    end
  end

  def cyworld_url(url)
    if url.blank?
      PageMetadata.first.link
    else
      url
    end
  end

  def cyworld_body(feed)
    html = ""

    unless feed.message.blank?
      html += break_line(feed.message)
    end

    unless feed.link.blank?
      html += "<br /><br />"
      html += "<a href=\"#{feed.link}\" target=\"_blank\">from facebook(Joseph-project)</a>"
    end

    html
  end

  def break_line(text)
    text.gsub("\n", "<br />")
  end

end
