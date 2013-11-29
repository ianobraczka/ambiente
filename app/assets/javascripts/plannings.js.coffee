# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$("#add-period").click ->
	$("div #period-to-be-removed").last().attr({"id":"period-not-to-be-removed"})
	$("#period-fields-container").append("<div id='period-to-be-removed'><label>Quantidade planejada no período<label> <input type='number' id='planned-quantity'></div>")
	$("#period-to-be-removed").css({"opacity":"0.0"})
	$("#period-to-be-removed").animate({opacity:"1.0"}, 300)

$("#remove-period").click ->
	$("#period-to-be-removed").animate({opacity:"0.0"}, 300, ->
		$("#period-to-be-removed").remove()
		$("div #period-not-to-be-removed").last().attr({"id":"period-to-be-removed"})
	)