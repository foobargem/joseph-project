module BaseHelper


  #
  # Back Navigation Helpers
  #
  
  def current_url
    request.request_uri
  end
  
  def url_to_return(default)
    session[:return_to] || default
  end

  def hidden_field_url_to_return
    hidden_field_tag :return_to, session[:return_to]
  end

  def link_to_history_back(text, options = {})
    link_to_function text, "history.back()", options
  end



  #
  # HTML Template Helpers
  #
  
	def display_clear_div
		"<div class=\"clear\"></div>"
	end

  def text_with_line_break(text)
    ( h(text).strip.gsub("\n", "<br />") )
  end



  #
  # Header Yield Helpers
  #
  
  def title(arg)
    content_for(:title) { arg }
  end
  
  def stylesheet(*args)
    content_for(:stylesheets) { stylesheet_link_tag(*args) }
  end
  
  def javascript(*args)
    content_for(:javascripts) { javascript_include_tag(*args) }
  end
  
  def header(arg)
    content_for(:header) { arg }
  end
  
  def header_with_partial(arg)
    content_for(:header) { render :partial => arg }
  end



  #
  # Navigation Test Helpers
  #

  def current_controller?(rhs)
    if rhs
      if rhs.is_a?(Array)
        rhs.include?(params[:controller])
      else
        rhs == params[:controller]
      end
    else
      false
    end
  end

  def current_action?(rhs)
    if rhs
      if rhs.is_a?(Array)
        rhs.include?(params[:action])
      else
        rhs == params[:action]
      end
    else
      false
    end
  end

  def current_param?(param_name, rhs)
    v = params[param_name]
    
    if rhs.is_a?(Array)
      rhs.include?(v)
    else
      rhs == v
    end
  end

  def navigation_tag(tag_name, condition, content)
    content_tag tag_name, content, :class => (condition ? "current" : nil)
  end
  
  def display_li_split
    "<li class='split'>|</li>"
  end



  # URL Parameter Helpers
  #
	def url_with_merged_param(options = {})
		queries = (options.inject(h = {}) {|h,v| h.merge(v[0].to_s => v[1])}).reverse_merge(request.query_parameters)
		"#{request.path}?#{queries.to_param}"
	end
	
	def merge_params(options = {})
		(options.inject(h = {}) {|h,v| h.merge(v[0].to_s => v[1])}).reverse_merge(request.query_parameters)
	end



  # BODY tag helper
  
  def body_START
    bs = USE_BODY_TAG_WITH_BROWSER_CLASS ? "<body class=\"#{browser_class_name}\">" : "<body>"
    if USE_MIN_WIDTH_CONTAINER
      bs += %q{<div class="fixedwidth"><div class="minwidth"><div class="minwidth_wrapper"><div class="minwidth_holder">}
    end
    raw bs
  end
  
  def body_END
    raw (USE_MIN_WIDTH_CONTAINER ? "</div></div></div></div></body>" : "</body>")
  end

end
