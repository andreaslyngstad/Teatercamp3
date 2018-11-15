$('#spinning_' + <%= escape_javascript( @invoice.id.to_s)  %>).removeClass("spinning").addClass("passed");
$('#send_link_' + <%= escape_javascript( @invoice.id.to_s)  %>).text("KREDITERT!")
