//
//
//
var _YooJin = {
  
  firstValue: function() {
    for (var i = 0; i < arguments.length; i++) {
      if (arguments[i] !== undefined) {
        return arguments[i];
      }
    }
    return undefined;
  },
  

  //
  //
  //
  getCenterPosition: function(element) {
    var dim_popup = Element.getDimensions(element);
    var popup_width = dim_popup.width;
    var popup_height = dim_popup.height;
    
    var dim_viewport = this.getViewportDimensions();
    var viewport_width = dim_viewport.width;
    var viewport_height = dim_viewport.height;

    var x;
    if (popup_width >= viewport_width) {
      x = 0;
    }
    else {
      x = (viewport_width - popup_width)/2;
    }

    var y;
    if (popup_height >= viewport_height) {
      y = 0;
    }
    else {
      y = (viewport_height - popup_height)/2;
    }
    
    return {x:x, y:y}
  },
  
  getBelowPosition: function(base_element) {
    var pos = Position.positionedOffset($(base_element));
    return {x: pos[0], y: pos[1] + Element.getHeight(base_element)};
  },

  getAutoPosition: function(mouse_x, mouse_y) {
    dim = Element.getDimensions(this.popup);
    var popup_width = dim.width;
    var popup_height = dim.height;
    dim = this.get_viewport_dimensions();
    var viewport_width = dim.width;
    var viewport_height = dim.height;

    var available_right = viewport_width - (mouse_x + this.options.cursor_margin);
    var available_left = mouse_x - this.options.cursor_margin;
    var available_top = mouse_y - this.options.cursor_margin;
    var available_bottom = viewport_height - (mouse_x + this.options.cursor_margin);
    var offset = this.options.cursor_margin;
    var x = mouse_x;
    var y = mouse_y;

    if (popup_width >= viewport_width) {
      x = 0;
    }
    else if (popup_width <= available_right) {
      x += offset;
    }
    else if (popup_width <= available_left) {
      x -= popup_width + offset;
    }
    else if (available_right >= available_left) {
      x = viewport_width - popup_width;
    }
    else {
      x = 0;
    }

    if (popup_height >= viewport_height) {
      y = 0;
    }
    else if (popup_height <= available_bottom) {
      y += offset;
    }
    else if (popup_height <= available_top) {
      y -= popup_height + offset;
    }
    else if (available_bottom >= available_top) {
      y = viewport_height - popup_height;
    }
    else {
      y = 0;
    }

    return {x: x, y: y}; 
  },

  getViewportDimensions: function() {
		var dim = this.getPageSize();
    return {width: dim[2], height: dim[3]};
  },

  getPageDimensions: function() {
		var dim = this.getPageSize();
    return {width: dim[0], height: dim[1]};
  },

  // This function from Lightbox v2.02 by Lokesh Dhakar
  // (http://www.huddletogether.com/projects/lightbox2/).
  //
  // Returns array with page width, height and window width, height
  // Core code from - quirksmode.org
  // Edit for Firefox by pHaez
  //
  getPageSize: function() {
    var xScroll, yScroll;

    if (window.innerHeight && window.scrollMaxY) {	
      xScroll = document.body.scrollWidth;
      yScroll = window.innerHeight + window.scrollMaxY;
    } else if (document.body.scrollHeight > document.body.offsetHeight){ // all but Explorer Mac
      xScroll = document.body.scrollWidth;
      yScroll = document.body.scrollHeight;
    } else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari
      xScroll = document.body.offsetWidth;
      yScroll = document.body.offsetHeight;
    }

    var windowWidth, windowHeight;
    if (self.innerHeight) {	// all except Explorer
      windowWidth = self.innerWidth;
      windowHeight = self.innerHeight;
    } else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode
      windowWidth = document.documentElement.clientWidth;
      windowHeight = document.documentElement.clientHeight;
    } else if (document.body) { // other Explorers
      windowWidth = document.body.clientWidth;
      windowHeight = document.body.clientHeight;
    }	
    
    // for small pages with total height less then height of the viewport
    if(yScroll < windowHeight){
      pageHeight = windowHeight;
    } else { 
      pageHeight = yScroll;
    }

    // for small pages with total width less then width of the viewport
    if(xScroll < windowWidth){	
      pageWidth = windowWidth;
    } else {
      pageWidth = xScroll;
    }

    arrayPageSize = new Array(pageWidth,pageHeight,windowWidth,windowHeight);
    return arrayPageSize;
  }
  
};





//
//
//
var SB_Popup = Class.create();

SB_Popup.prototype = Object.extend(_YooJin, {

  initialize: function(popup) {
    
    var options = Object.extend({
      modal: false
    }, arguments[2] || {});

    options.duration = this.firstValue(options.duration, 0.3);
    options.show_duration = this.firstValue(options.show_duration, options.duration);
    options.hide_duration = this.firstValue(options.hide_duration, options.duration);
    options.opacity = this.firstValue(options.opacity, 0.6);
    this.options = options;

    this.popup = $(popup);
    this.popup.popup = this;  // Make the popup object a property of the DOM popup element
    
    this.popup.addClassName("SB_Popup_popup");
  },

  
  //
  //
  //
  showPopup: function(position, object) {
    var pos;
    var base_element = $(object);
    
    if (position == "below") {
      pos = this.getBelowPosition(base_element);
    }
    else if (position == "auto") {
      
    }

    Element.setStyle(this.popup, { top: pos.y + "px", left: pos.x + "px" });
    new Effect.Appear(this.popup, { duration: this.options.show_duration });
  },
  
  closePopup: function() {
    new Effect.Fade(this.popup, { duration: this.options.hide_duration });
  },

  togglePopup: function(position, object) {
    if (this.isOpen()) this.closePopup();
    else this.showPopup(position, object);
  },
  
  isOpen: function() {
    return this.popup.visible();
  },
  
  
  
  //
  //
  //
  showModal: function() {
    this._showOverlay(this.popup);
    var pos = this.getCenterPosition(this.popup);
    Element.setStyle(this.popup, { top: pos.y + "px", left: pos.x + "px" });
    new Effect.Appear(this.popup, { duration: this.options.show_duration });
  },
  
  closeModal: function() {
    new Effect.Fade(this.popup, { duration: this.options.hide_duration });
    this._hideOverlay();
  },
  
  showLoading: function() {
  },
  
  hideLoading: function() {
  },
  
  _showOverlay: function(dest) {
    if (!SB_Popup.overlay) {
      var overlay = document.createElement('div');
      overlay.setAttribute('id','SB_Popup_overlay');
      overlay.style.display = 'none';
      document.body.appendChild(overlay);
      SB_Popup.overlay = overlay;
      
      Event.observe(overlay, "click", function(e){Event.stop(e)});
    }
    
    SB_Popup.overlay.parentNode.appendChild(dest);
    SB_Popup.overlay.style.height = this.getPageDimensions().height + 'px';
    
    new Effect.Appear(SB_Popup.overlay, {
      duration: this.options.show_duration, 
      to: this.options.opacity,
      queue: { position: 'end', scope: 'SB_Popup_overlay' }}
    );
  },
  
  _hideOverlay: function() {
    new Effect.Fade(SB_Popup.overlay, { 
      duration: this.options.hide_duration,
      queue: { position: 'end', scope: 'SB_Popup_overlay'}}
    );
  }
  
});






////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////

(function(){
  Event.observe(window.document, "click", closeAllPopup);
})();

var __shouldCloseAllPopup = true;

function closeAllPopup(ev) {
  var e = $(ev.srcElement || ev.target);

  var click_popup;
  if (e.hasClassName("SB_Popup_popup")) click_popup = e;
  else click_popup = e.up(".SB_Popup_popup");
  
  if (__shouldCloseAllPopup) {
    
    if (!click_popup) {
      $$(".SB_Popup_popup").invoke("hide");
    }
    
    $$(".SB_select .select_button").each(function(button){
      if (e.descendantOf(button)) {
        
      } else {
        button.removeClassName("clicked");
      }
    });
    
    
    if (click_popup && click_popup.hasClassName("select_options")) {
      click_popup.hide();
    }
    
  }
};





