module FeedsHelper

  def cyword_date_format(date)
    date.strftime("%Y%m%d%H%M%S")
  end

  def break_line(text)
    text.gsub("\n", "<br />")
  end

end
