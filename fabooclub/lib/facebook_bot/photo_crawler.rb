module FacebookBot
  class PhotoCrawler

    attr_reader :response, :origin_picture_url, :width, :height

    def initialize(fb_id, html_url)
      @html_url = html_url
      @tmp_dir = "/tmp"
      @response = false

      get_photo_element
      unless @picture_ele.nil?
        set_tmp_photofile_name(fb_id)
        download_photofile_to_tmp
        get_resolution
        delete_tmp_file
      end
    end

    def get_photo_element
      doc = Nokogiri::HTML(open(@html_url))
      @picture_ele = doc.css('img#myphoto').first
      unless @picture_ele.nil?
        @response = true
        @origin_picture_url = @picture_ele['src']
      end
    end


    def set_tmp_photofile_name(fb_id)
      @tmp_photofile= "#{@tmp_dir}/_facebook_pic_#{fb_id}#{File.extname(@picture_ele['src'])}"
    end

    def download_photofile_to_tmp
      system("wget -O #{@tmp_photofile} #{@picture_ele['src']}")
    end

    def get_resolution
      geometry = `identify -verbose #{@tmp_photofile} | grep 'Geometry:' | awk {'print $2'}`
      geometry.chomp!
      @width, @height = geometry.split("+").first.split("x")
    end

    def delete_tmp_file
      File.delete(@tmp_photofile)
    end

  end
end
