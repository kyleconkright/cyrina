(function() {
  $(function() {
    return $.ajax({
      url: 'data/data.json',
      type: 'GET',
      dataType: 'json',
      success: function(results) {
        $('<div class="bit-2 nav"></div>').appendTo('div.frame #menu');
        $.each(results.response.nav.links, function() {
          return $('<a href="' + this.href + '">' + this.val + '</a>').appendTo('#menu .nav');
        });
        $.each(results.response.videos, function() {
          $('<div id="' + this.id + '" class="bit-1 gallery"><h3>' + this.title + '</h3></div>').appendTo('div#videos div#content');
          return $.each(this.video, function() {
            return $('<div class="bit-5 item"> <a href="assets/vid/' + this.type + '/' + this.clip + '" data-lightbox-gallery="' + this.type + '" style="background-image: url(assets/img/' + this.type + '/' + this.img + ')"></a> <p class="caption">' + this.caption + '</p> </div>').appendTo('div#videos #content');
          });
        });
        $.each(results.response.photos, function() {
          $('<div id="' + this.id + '" class="bit-1 gallery"><h3>' + this.title + '</h3></div>').appendTo('div#photos div#content');
          return $.each(this.photo, function() {
            return $('<div class="bit-5 item"> <a href="assets/img/' + this.type + '/' + this.img + '" data-lightbox-gallery="' + this.type + '" style="background-image: url(assets/img/' + this.type + '/' + this.img + ')"></a> </div>').appendTo('div#photos #content');
          });
        });
        $('<p>' + results.response.bio + '</p>').appendTo('div#bio #content');
        $.each(results.response.resume, function() {
          return $('<div id="' + this.id + '" class="bit-1 resume"><h3>' + this.title + '</h3></div>').appendTo('div#resume #content');
        });
        $.each(results.response.resume[0].entry, function() {
          console.log(this.title);
          return $('<div class="title bit-3"><p>' + this.title + '</p></div><div class="role bit-3"><p>' + this.role + '</p></div><div class="item bit-3"><p>' + this.item + '</p></div>').appendTo('div#resume div#' + this.rel + '.resume');
        });
        $.each(results.response.resume[1].entry, function() {
          console.log(this.title);
          return $('<div class="title bit-3"><p>' + this.title + '</p></div><div class="role bit-3"><p>' + this.role + '</p></div><div class="item bit-3"><p>' + this.item + '</p></div>').appendTo('div#resume div#' + this.rel + '.resume');
        });
        $.each(results.response.resume[2].entry, function() {
          console.log(this.title);
          return $('<div class="title bit-3"><p>' + this.title + '</p></div><div class="role bit-3"><p>' + this.role + '</p></div><div class="item bit-3"><p>' + this.item + '</p></div>').appendTo('div#resume div#' + this.rel + '.resume');
        });
        $.each(results.response.resume[3].entry, function() {
          console.log(this.title);
          return $('<div class="title bit-3"><p>' + this.title + '</p></div><div class="role bit-3"><p></p></div><div class="item bit-3"><p>' + this.inst + '</p></div>').appendTo('div#resume div#' + this.rel + '.resume');
        });
        $.each(results.response.resume[4].entry, function() {
          var item;
          item = (function() {
            var _i, _len, _ref, _results;
            _ref = this.items;
            _results = [];
            for (_i = 0, _len = _ref.length; _i < _len; _i++) {
              item = _ref[_i];
              _results.push(' ' + item);
            }
            return _results;
          }).call(this);
          return $('<div class="frame"><div class="title bit-3"><p>' + this.title + '</p></div><div class="item bit-66"><p>' + item + '</p></div></div>').appendTo('div#resume div#' + this.rel + '.resume');
        });
        $.each(results.response.contact, function() {
          console.log(this.title);
          return $('<div class="bit-4"> <h3>' + this.title + '</h3> <p>' + this.company + '</p> <p>' + this.rep + '</p> <p>' + this.phone + '</p> <p>' + this.fax + '</p> <p>' + this.site + '</p> <p>' + this.email + '</p> </div>').appendTo('div#contact #content');
        });
        ({
          complete: function() {}
        });
        $('#photos #content').magnificPopup({
          delegate: 'a',
          type: 'image',
          gallery: {
            enabled: true
          }
        });
        return $('#videos #content').magnificPopup({
          delegate: 'a',
          type: 'iframe',
          gallery: {
            enabled: true
          }
        });
      }
    });
  });

}).call(this);
