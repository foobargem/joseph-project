xml.instruct! :xml, :version => "1.0"

xml.PostInfo :xmlns => "urn:skcomms:prod",
             :"xmlns:xsi" => "http://www.w3.org/2001/XMLSchema-instance",
             :"xsi:schemaLocation" => "urn:skcomms:prod http://api.cyworld.com/xml/openscrap/post/v1/openpost.xsd" do
  xml.SID CYWORLD_CONFIG['api_key']
  xml.Post do
    xml.Subject { xml.cdata! truncate(@feed.message, 30, "...") }
    xml.OriginContentsText01 { xml.cdata! break_line(@feed.message) }
    unless @feed.picture.blank?
      xml.OriginPhotoLink01 do
        xml.Url { xml.cdata! @feed.picture }
        #xml.Width "400"
        #xml.Height "400"
      end
    end
    xml.Url { xml.cdata! @feed.link }
    xml.OriginOrder "OriginPhotoLink01|OriginContentsText01"
    xml.LastUpdateDate cyword_date_format(@feed.created_at)
  end
end
