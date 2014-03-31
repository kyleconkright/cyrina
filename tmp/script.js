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
            return $('<li><span class="thumb" style="background-image: url(assets/img/' + this.type + '/' + this.url + ')"><a data-lightbox-gallery="' + this.type + '" href="assets/vid/' + this.type + '/' + this.clip + '"></a></span><p class="caption">' + this.caption + '</p></li>').appendTo('div#videos ul#' + this.rel);
          });
        });
        $.each(results.response.photos, function() {
          $('<ul id="' + this.id + '" class="gallery"><h3>' + this.title + '</h3></ul>').appendTo('div#photos');
          return $.each(this.photo, function() {
            return $('<li><span class="thumb" style="background-image: url(assets/img/' + this.type + '/' + this.url + ')"><a data-lightbox-gallery="' + this.type + '" href="assets/img/' + this.type + '/' + this.url + '"></a></span></li>').appendTo('div#photos ul#' + this.rel + '.gallery');
          });
        });
        return $.each(results.response.resume, function() {
          $('<ul id="' + this.id + '" class="resume"><h3>' + this.title + '</h3></ul>').appendTo('div#resume');
          return $.each(this.entry, function() {
            return $('<li><span class="title"><p>' + this.title + '</p></span><span class="role"><p>' + this.role + '</p></span><p><span class="item">' + this.item + '</p></span></li>').appendTo('div#resume ul#' + this.rel + '.resume');
          });
        });
      },
      complete: function() {
        return $('ul.gallery a').nivoLightbox();
      }
    });
  });

}).call(this);
