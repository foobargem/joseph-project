
document.observe('dom:loaded', function(){

  var open_cyworld_scrap = function(ev) {
    var url = "http://api.cyworld.com/openscrap/post/v1/?sid=txWo4wt9EaCcO5mcNiHS51VdmbdDaGCw";
    var element = ev.element().parentNode;

    //console.debug( element );
    url += "&xu=" + $(element).href;

    ev.stop();
    window.open(url, 'cyopenscrap', 'width=450,height=410');

    return false;
  };

  $$('a.cyworld_scrap_btn').each(function(element){
    Event.observe(element, 'click', open_cyworld_scrap);
  });

});

