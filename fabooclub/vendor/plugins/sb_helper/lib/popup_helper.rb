module PopupHelper
  
  def link_to_popup(name, id, html_options = {})
    if remote = html_options[:remote]
      html_options.delete(:remote)
      href = id
    else
      href = "##{id.to_s}"
    end
    html_options[:class] = html_options[:class].to_s + " popup modal"
    link_to name, href, html_options
  end

  def link_to_close_popup(name, html_options = {})
    link_to name, "#", html_options.merge({:onclick => "return Popup.closePopup(this)"})
  end

end
