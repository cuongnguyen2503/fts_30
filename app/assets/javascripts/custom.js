function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  $("#option-fields").append(content.replace(regexp, new_id));
}

$(function(){
  var counter = 2400
  setInterval(function(){
    counter--;
    var hour = Math.floor(counter/3600);
    var minute = Math.floor((counter % 3600)/60);
    var second = (counter % 3600) % 60;
    if (counter >= 0){
      $("#hour").html(hour);
      $("#minute").html(minute);
      $("#second").html(second);
    }
    else {
      clearInterval();
      $(".submit-exam").click();
    }
  }, 1000);
});

$(document).ready(function(){
  $("#text").click(function(){
    $("#option-fields").hide();
    $("#answer-field").show();
  });
  $("#single_choice").click(function(){
    $("#option-fields").show();
    $("#answer-field").hide();
  });
  $("#multiple_choices").click(function(){
    $("#option-fields").show();
    $("#answer-field").hide();
  });
});