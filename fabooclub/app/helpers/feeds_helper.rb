module FeedsHelper

  def cyword_date_format(date)
    date.strftime("%Y%m%d%H%M%S")
  end

  def cyworld_subject(feed)
    if feed.name
      feed.name
    elsif feed.message
      truncate(feed.message, 30, "...")
    elsif feed.caption
      feed.caption
    else
      "no subject"
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

    unless feed.caption.blank?
      html += "caption: #{break_line(feed.caption)} <br />"
    end

    unless feed.name.blank?
      html += "#{break_line(feed.name)} <br />"
    end

    unless feed.message.blank?
      html += "#{break_line(feed.message)} <br />"
    end

    unless feed.link.blank?
      html += "<a href=\"#{feed.link}\" target=\"_blank\">from facebook(Joseph-project)</a>"
    end

    html
  end

  def break_line(text)
    text.gsub("\n", "<br />")
  end

end
