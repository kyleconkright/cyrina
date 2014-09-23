$ ->

	# $.ajax
	# 	url: 'data/data.json'
	# 	type: 'GET'
	# 	dataType: 'json'
	# 	success: (results) ->
	# 		$('<div class="frame" id="menu"></div>').appendTo('div.section div.wrapper')
	# 		$.each results.response.nav.links, ->
	# 			$('<div class="bit-2"></div>')
	# 			.append('<a href="' + this.href + '">' + this.val + '</a>')
	# 			.appendTo('div.section div.wrapper ul#menu')

	$.ajax
		url: 'data/data.json'
		type: 'GET'
		dataType: 'json'
		success: (results) ->
			$('<div class="bit-2 nav"></div>').appendTo('div.frame #menu')
			$.each results.response.nav.links, ->
				$('<a href="' + this.href + '">' + this.val + '</a>')
				.appendTo('#menu .nav')

			$.each results.response.videos, ->
				$('<div id="' + this.id + '" class="bit-1 gallery"><h3>' + this.title + '</h3></div>').appendTo('div#videos div#content')
				$.each this.video, ->
					$('<div class="bit-5 item">
						<a href="assets/vid/'+this.type+'/'+this.clip+'" data-lightbox-gallery="' + this.type + '" style="background-image: url(assets/img/'+this.type+'/'+this.img+')"></a>
						<p class="caption">'+this.caption+'</p>
						</div>')
					.appendTo('div#videos #content')

			$.each results.response.photos, ->
				$('<div id="' + this.id + '" class="bit-1 gallery"><h3>' + this.title + '</h3></div>').appendTo('div#photos div#content')
				$.each this.photo, ->
					$('<div class="bit-5 item">
						<a href="assets/img/'+this.type+'/'+this.img+'" data-lightbox-gallery="' + this.type + '" style="background-image: url(assets/img/'+this.type+'/'+this.img+')"></a>
						</div>')
					.appendTo('div#photos #content')

			$('<p>' + results.response.bio + '</p>').appendTo('div#bio #content')

			$.each results.response.resume, ->
				$('<div id="' + this.id + '" class="bit-1 resume"><h3>' + this.title + '</h3></div>').appendTo('div#resume #content')

			$.each results.response.resume[0].entry, ->
					console.log this.title
					$('<div class="title bit-3"><p>' + this.title + '</p></div><div class="role bit-3"><p>' + this.role + '</p></div><div class="item bit-3"><p>' + this.item + '</p></div>')
					.appendTo('div#resume div#' + this.rel + '.resume')

			$.each results.response.resume[1].entry, ->
					console.log this.title
					$('<div class="title bit-3"><p>' + this.title + '</p></div><div class="role bit-3"><p>' + this.role + '</p></div><div class="item bit-3"><p>' + this.item + '</p></div>')
					.appendTo('div#resume div#' + this.rel + '.resume')

			$.each results.response.resume[2].entry, ->
					console.log this.title
					$('<div class="title bit-3"><p>' + this.title + '</p></div><div class="role bit-3"><p>' + this.role + '</p></div><div class="item bit-3"><p>' + this.item + '</p></div>')
					.appendTo('div#resume div#' + this.rel + '.resume')

			$.each results.response.resume[3].entry, ->
					console.log this.title
					$('<div class="title bit-3"><p>' + this.title + '</p></div><div class="role bit-3"><p></p></div><div class="item bit-3"><p>' + this.inst + '</p></div>')
					.appendTo('div#resume div#' + this.rel + '.resume')

			$.each results.response.resume[4].entry, ->
				item = (' ' + item for item in this.items)
				$('<div class="frame"><div class="title bit-3"><p>' + this.title + '</p></div><div class="item bit-66"><p>' + item + '</p></div></div>')
				.appendTo('div#resume div#' + this.rel + '.resume')



			$.each results.response.contact, ->
				console.log this.title
				$('<div class="bit-3">
					<h3>' + this.title + '</h3>
					<p>' + this.company + '</p>
					<p>' + this.rep + '</p>
					<p>' + this.phone + '</p>
					<p>' + this.fax + '</p>
					<p>' + this.site + '</p>
					<p>' + this.email + '</p>
				</div>').appendTo('div#contact #content')

		 complete: ->
			$('#photos #content').magnificPopup({
			  delegate: 'a'
			  type: 'image'
			  gallery:{
			      enabled:true
			    }
			})

			$('#videos #content').magnificPopup({
			  delegate: 'a'
			  type: 'iframe'
			  gallery:{
			      enabled:true
			    }
			})







		# 	$.each results.response.videos, ->
		# 		$('<ul id="' + this.id + '" class="gallery"><h3>' + this.title + '</h3></ul>').appendTo('div#videos')
		# 		$.each this.video, ->
		# 			$('<li><span class="thumb" style="background-image: url(assets/img/' + this.type + '/' + this.url + ')"><a data-lightbox-gallery="' + this.type + '" href="assets/vid/' + this.type + '/' + this.clip + '"></a></span><p class="caption">' + this.caption + '</p></li>')
		# 			.appendTo('div#videos ul#' + this.rel)

		# 	$.each results.response.photos, ->
		# 		$('<ul id="' + this.id + '" class="gallery"><h3>' + this.title + '</h3></ul>').appendTo('div#photos')
		# 		$.each this.photo, ->
		# 			$('<li><span class="thumb" style="background-image: url(assets/img/' + this.type + '/' + this.url + ')"><a data-lightbox-gallery="' + this.type + '" href="assets/img/' + this.type + '/' + this.url + '"></a></span></li>')
		# 			.appendTo('div#photos ul#' + this.rel + '.gallery')

		# 	$.each results.response.resume, ->
		# 		$('<ul id="' + this.id + '" class="resume"><h3>' + this.title + '</h3></ul>').appendTo('div#resume')

		# 	$.each results.response.resume[0].entry, ->
		# 		$('<li><span class="title"><p>' + this.title + '</p></span><span class="role"><p>' + this.role + '</p></span><p><span class="item">' + this.item + '</p></span></li>')
		# 		.appendTo('div#resume ul#' + this.rel + '.resume')

		# 	$.each results.response.resume[1].entry, ->
		# 		$('<li><span class="title"><p>' + this.title + '</p></span><span class="role"><p>' + this.role + '</p></span><p><span class="item">' + this.item + '</p></span></li>')
		# 		.appendTo('div#resume ul#' + this.rel + '.resume')

		# 	$.each results.response.resume[2].entry, ->
		# 		$('<li><span class="title"><p>' + this.title + '</p></span><span class="role"><p>' + this.role + '</p></span><p><span class="item">' + this.item + '</p></span></li>')
		# 		.appendTo('div#resume ul#' + this.rel + '.resume')

		# 	$.each results.response.resume[3].entry, ->
		# 		$('<li><span class="title"><p>' + this.title + '</p></span><p><span class="item">' + this.inst + '</p></span></li>')
		# 		.appendTo('div#resume ul#' + this.rel + '.resume')

		# 	$.each results.response.resume[4].entry, ->
		# 		item = (' ' + item for item in this.items)
		# 		$('<li><span class="title"><p>' + this.title + '</p>' + item + '</span>')
		# 		.appendTo('div#resume ul#' + this.rel + '.resume')

		# 	$.each results.response.contact, ->
		# 		$('<ul id="' + this.id + '">
		# 			<li><h3>' + this.title + '</h3></li>
		# 			<li>' + this.rep + '</li>
		# 			<li>' + this.company + '</li>
		# 			<li>' + this.phone + '</li>
		# 			<li>' + this.fax + '</li>
		# 			<li>' + this.email + '</li>
		# 			<li>' + this.site + '</li>
		# 			</ul>')
		# 		.appendTo('div#contact #listings')


		# complete: ->
		# 	$('#photos ul.gallery').magnificPopup({
		# 	  delegate: 'a'
		# 	  type: 'image'
		# 	  gallery:{
		# 	      enabled:true
		# 	    }
		# 	})

		# 	$('#videos ul.gallery').magnificPopup({
		# 	  delegate: 'a'
		# 	  type: 'iframe'
		# 	  gallery:{
		# 	      enabled:true
		# 	    }
		# 	})
		# 	biotext = $('.biotext')
		# 	$('div#bio div.wrapper').after biotext
