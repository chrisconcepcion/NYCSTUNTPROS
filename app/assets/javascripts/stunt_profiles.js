function remove_fields(link) {
  
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".credit_fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $(link).parent().parent().before(content.replace(regexp, new_id));
}

//$(document).ready(function () {    
//	$("#panel1").removeClass("active");
//});