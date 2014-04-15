(function() {
  $(function() {
    return $.ajax({
      url: 'data/data.json',
      type: 'GET',
      dataType: 'json',
      success: function(results) {
        $('<ul id="menu"></ul>').appendTo('div.section div.holder');
        $.each(results.response.nav.links, function() {
          return $('<li></li>').append('<a href="' + this.href + '">' + this.val + '</a>').appendTo('div.section div.holder ul#menu');
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
        $.each(results.response.resume, function() {
          return $('<ul id="' + this.id + '" class="resume"><h3>' + this.title + '</h3></ul>').appendTo('div#resume');
        });
        $.each(results.response.resume[0].entry, function() {
          return $('<li><span class="title"><p>' + this.title + '</p></span><span class="role"><p>' + this.role + '</p></span><p><span class="item">' + this.item + '</p></span></li>').appendTo('div#resume ul#' + this.rel + '.resume');
        });
        $.each(results.response.resume[1].entry, function() {
          return $('<li><span class="title"><p>' + this.title + '</p></span><span class="role"><p>' + this.role + '</p></span><p><span class="item">' + this.item + '</p></span></li>').appendTo('div#resume ul#' + this.rel + '.resume');
        });
        $.each(results.response.resume[2].entry, function() {
          return $('<li><span class="title"><p>' + this.title + '</p></span><span class="role"><p>' + this.role + '</p></span><p><span class="item">' + this.item + '</p></span></li>').appendTo('div#resume ul#' + this.rel + '.resume');
        });
        $.each(results.response.resume[3].entry, function() {
          return $('<li><span class="title"><p>' + this.title + '</p></span><p><span class="item">' + this.inst + '</p></span></li>').appendTo('div#resume ul#' + this.rel + '.resume');
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
          return $('<li><span class="title"><p>' + this.title + '</p>' + item + '</span>').appendTo('div#resume ul#' + this.rel + '.resume');
        });
        return $.each(results.response.contact, function() {
          return $('<ul id="' + this.id + '"> <li><h3>' + this.title + '</h3></li> <li>' + this.rep + '</li> <li>' + this.company + '</li> <li>' + this.phone + '</li> <li>' + this.fax + '</li> <li>' + this.email + '</li> <li>' + this.site + '</li> </ul>').appendTo('div#contact #listings');
        });
      },
      complete: function() {
        var biotext;
        $('#photos ul.gallery').magnificPopup({
          delegate: 'a',
          type: 'image',
          gallery: {
            enabled: true
          }
        });
        $('#videos ul.gallery').magnificPopup({
          delegate: 'a',
          type: 'iframe',
          gallery: {
            enabled: true
          }
        });
        biotext = $('.biotext');
        return $('div#bio div.holder').after(biotext);
      }
    });
  });

}).call(this);
