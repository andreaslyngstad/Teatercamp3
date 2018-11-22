//= require jquery
//= require jquery_ujs
//= require_self
//= require_tree .

jQuery.ajaxSetup({
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})

jQuery.fn.submitWithAjax = function() {
  this.submit(function() {
    $.post(this.action, $(this).serialize(), null, "script");
    $('.spinning').show();
    return false;
  })
  return this;
};

jQuery.fn.send_invoice = function (){
  this.on('click', function() {
    var invoice_id =  $(this).attr("data-id");
    var object =  $(this).attr("data-object");
    $('#spinning_' + invoice_id).show();
  $.getScript("/invoice_send/" + invoice_id )
    })
};
jQuery.fn.send_reminder = function (){
  this.on('click', function() {

    var invoice_id =  $(this).attr("data-id");
    $('#spinning_' + invoice_id).show();
 	 $.getScript("/send_reminder/" + invoice_id)
    })
};
jQuery.fn.send_credit_note = function (){
  this.on('click', function() {

    var invoice_id =  $(this).attr("data-id");
    $('#spinning_' + invoice_id).show();
 	 $.getScript("/credit_note/" + invoice_id)
    })
};




$(document).ready(function() {

  $('#fullpage').fullpage({
    //Navigation
    sectionsColor: ['#2b1547', '#173414', '#194379', '#f46015', '#2b1547', '#173414', '#194379', '#f46015'],
        // anchors: ['index', 'kurs', 'news'],
        menu: '#menu',
        continuousVertical: true,
        resize : false
  });
	$('input#search').quicksearch('table.tablesorter tbody tr', {

	});
  $('.square').click(function(){
    var id = this.id
    window.location.href = '/registrations/new?id=' + id;
  })
	$(".tablesorter").tablesorter();
	$(".send_link").send_invoice();
  $(".send_link_credit").send_credit_note();
	$(".send_link_reminder").send_reminder();

    /*
      Progressive enhancement.  If javascript is enabled we change the body class.  Which in turn hides the checkboxes with css.
    */
    $('body').attr("class","js");

    /*
      Add toggle switch after each checkbox.  If checked, then toggle the switch.
    */

     /*
      When the toggle switch is clicked, check off / de-select the associated checkbox
     */

    $('.toggle').click(function(e) {
		var id = $(this).attr('data_id')
		$("#paid_spinning_" + id).show();
		$.get("/set_paid/" + id);


      e.preventDefault();

    });


  });
