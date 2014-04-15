$ ->

	$.ajax
		url: 'data/data.json'
		type: 'GET'
		dataType: 'json'
		success: (results) ->
			$('<ul id="menu"></ul>').appendTo('div.section div.holder')
			$.each results.response.nav.links, ->
				$('<li></li>')
				.append('<a href="' + this.href + '">' + this.val + '</a>')
				.appendTo('div.section div.holder ul#menu')

			$.each results.response.videos, ->
				$('<ul id="' + this.id + '" class="gallery"><h3>' + this.title + '</h3></ul>').appendTo('div#videos')
				$.each this.video, ->
					$('<li><span class="thumb" style="background-image: url(assets/img/' + this.type + '/' + this.url + ')"><a data-lightbox-gallery="' + this.type + '" href="assets/vid/' + this.type + '/' + this.clip + '"></a></span><p class="caption">' + this.caption + '</p></li>')
					.appendTo('div#videos ul#' + this.rel)

			$.each results.response.photos, ->
				$('<ul id="' + this.id + '" class="gallery"><h3>' + this.title + '</h3></ul>').appendTo('div#photos')
				$.each this.photo, ->
					$('<li><span class="thumb" style="background-image: url(assets/img/' + this.type + '/' + this.url + ')"><a data-lightbox-gallery="' + this.type + '" href="assets/img/' + this.type + '/' + this.url + '"></a></span></li>')
					.appendTo('div#photos ul#' + this.rel + '.gallery')

			$.each results.response.resume, ->
				$('<ul id="' + this.id + '" class="resume"><h3>' + this.title + '</h3></ul>').appendTo('div#resume')

			$.each results.response.resume[0].entry, ->
				$('<li><span class="title"><p>' + this.title + '</p></span><span class="role"><p>' + this.role + '</p></span><p><span class="item">' + this.item + '</p></span></li>')
				.appendTo('div#resume ul#' + this.rel + '.resume')

			$.each results.response.resume[1].entry, ->
				$('<li><span class="title"><p>' + this.title + '</p></span><span class="role"><p>' + this.role + '</p></span><p><span class="item">' + this.item + '</p></span></li>')
				.appendTo('div#resume ul#' + this.rel + '.resume')

			$.each results.response.resume[2].entry, ->
				$('<li><span class="title"><p>' + this.title + '</p></span><span class="role"><p>' + this.role + '</p></span><p><span class="item">' + this.item + '</p></span></li>')
				.appendTo('div#resume ul#' + this.rel + '.resume')

			$.each results.response.resume[3].entry, ->
				$('<li><span class="title"><p>' + this.title + '</p></span><p><span class="item">' + this.inst + '</p></span></li>')
				.appendTo('div#resume ul#' + this.rel + '.resume')

			$.each results.response.resume[4].entry, ->
				item = (' ' + item for item in this.items)
				$('<li><span class="title"><p>' + this.title + '</p>' + item + '</span>')
				.appendTo('div#resume ul#' + this.rel + '.resume')

			$.each results.response.contact, ->
				$('<ul id="' + this.id + '">
					<li><h3>' + this.title + '</h3></li>
					<li>' + this.rep + '</li>
					<li>' + this.company + '</li>
					<li>' + this.phone + '</li>
					<li>' + this.fax + '</li>
					<li>' + this.email + '</li>
					<li>' + this.site + '</li>
					</ul>')
				.appendTo('div#contact #listings')


		complete: ->
			$('#photos ul.gallery').magnificPopup({
			  delegate: 'a'
			  type: 'image'
			  gallery:{
			      enabled:true
			    }
			})

			$('#videos ul.gallery').magnificPopup({
			  delegate: 'a'
			  type: 'iframe'
			  gallery:{
			      enabled:true
			    }
			})
			biotext = $('.biotext')
			$('div#bio div.holder').after biotext
