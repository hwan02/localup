var locationData,
    selectCount = 0,
    findCount = 0;

$(document).ready(function() {
  getLocationJson()
});

$("#inputBox").focusout(function() {
	$("#insert").show();
});

$("#inputBox").keyup(function(e) {

  switch (e.keyCode) {
    case 8:
      selectCount = 0
      inputKeyEvent()
    break;

    case 32:
      if($("#inputBox").val() == " ") emptySpaceKeyEvent()
    return

    case 13:
      if($("div").hasClass("autoCompleteBox") == true) enterKeyEvent()
    return

    case 38:
      if($("div").hasClass("autoCompleteBox") == false) return
      upKeyEvent()
    return

    case 40:
      if($("div").hasClass("autoCompleteBox") == false) return
      downKeyEvent()
    return

    default:
      inputKeyEvent()
  }

});

$(document).on("mousedown", ".autoCompleteBox",function(e) {
  e.stopImmediatePropagation();
  $("#inputBox").val($(this).children()[1].innerHTML)
  $(".autoCompleteBox").remove()
  $(".autoCompleteContainer").remove()
})

$(document).on("blur", "#inputBox",function() {
  selectCount = 0
  $(".autoCompleteBox").remove()
  $(".autoCompleteContainer").remove()
})

$(document).on("mousedown", "#inputBox",function() {
  inputKeyEvent()
})

function getLocationJson() {
  $.getJSON( "/resources/login/data.json", function(data) {
    locationData = data
  });
}

function upKeyEvent() {
  if($(".autoCompleteBox").hasClass("selected") == false) return
  if(selectCount == 0) return
  $("#autoCompleteBox-"+selectCount+"").removeClass('selected')
  --selectCount
  $("#autoCompleteBox-"+selectCount+"").addClass('selected')
}

function downKeyEvent() {
  if($(".autoCompleteBox").hasClass("selected") == false) {
      $("#autoCompleteBox-"+selectCount+"").addClass('selected')
      return
  }
  if(selectCount == findCount) return

  $("#autoCompleteBox-"+selectCount+"").removeClass('selected')
  ++selectCount
  $("#autoCompleteBox-"+selectCount+"").addClass('selected')
}

function enterKeyEvent() {
    $("#inputBox").val($("#autoCompleteBox-"+selectCount+"").children()[1].innerHTML)
    $(".autoCompleteBox").remove()
    $(".autoCompleteContainer").remove()
    $("#insert").show();
}

function emptySpaceKeyEvent() {
  $("#inputBox").val("")
}

function inputKeyEvent() {
  $("#insert").hide();
  
  $(".autoCompleteBox").remove()
  $(".autoCompleteContainer").remove()

  var inputValue = $("#inputBox").val()

  if(inputValue == "") {
	  $("#insert").show();
	  return;
  }

  var searchLocation = locationData.filter(function (location) {
    return location.FULL_ADDR.match(inputValue)
  });

  if(searchLocation.length == 0) return
  
  $("#cont").append("<div class='autoCompleteContainer'></div>")
  for (var i = 0; i <= 2; i++) { //3개까지 보여주기
    if(searchLocation[i] == undefined) return
    findCount = i
    $(".autoCompleteContainer").append(generate(searchLocation[i], i))
    if(searchLocation[i].SUB_NAME == "") return
  }
}

function generate(searchLocation, i) {
  return `
  <div class="autoCompleteBox" id="autoCompleteBox-${i}">
    <span class="mainName">● ${searchLocation.MAIN_NAME}</span>
    <span class="fullAddr">${searchLocation.FULL_ADDR}</span>
  </div>
  `;
}
