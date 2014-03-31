(function() {
  $(function() {
    return $.ajax({
      url: 'data/data.json',
      type: 'GET',
      dataType: 'json',
      success: function(results) {
        $('<ul id="menu"></ul>').appendTo('div.section div');
        $.each(results.response.nav.links, function() {
          return $('<li></li>').append('<a href="' + this.href + '">' + this.val + '</a>').appendTo('div.section div ul#menu');
        });
        $.each(results.response.videos, function() {
          $('<ul id="' + this.id + '" class="gallery"><h3>' + this.title + '</h3></ul>').appendTo('div#videos');
          return $.each(this.video, function() {
            return $('<li><span class="thumb" style="background-image: url(assets/img/' + this.type + '/' + this.url + ')"><a href="assets/' + this.type + '/' + this.url + '"></a></span><p class="caption">' + this.caption + '</p></li>').appendTo('div#videos ul#' + this.rel);
          });
        });
        return $.each(results.response.photos, function() {
          $('<ul id="' + this.id + '" class="gallery"><h3>' + this.title + '</h3></ul>').appendTo('div#photos');
          return $.each(this.photo, function() {
            return $('<li><span class="thumb" style="background-image: url(assets/img/' + this.type + '/' + this.url + ')"><a href="assets/img/' + this.type + '/' + this.url + '"></a></span></li>').appendTo('div#photos ul#' + this.rel + '.gallery');
          });
        });
      }
    });
  });

}).call(this);
