# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(".add-period").click ->
	$("div #period-to-be-removed").last().attr({"id":"period-not-to-be-removed"})
	$("div #period-to-be-removed2").last().attr({"id":"period-not-to-be-removed2"})
	$("#period-fields-container").append("<div id='period-to-be-removed'><label>Quantidade planejada no período " + $(".add-period").attr("id") + "<label> <input type='number' name = 'planning[periods_attributes][" + $(".add-period").attr("id") + "][planned_quantity]' id='planned-quantity'></div>")
	$("#period-fields-container").append("<div id='period-to-be-removed2'><label>Valor planejado no período " + $(".add-period").attr("id") + "<label> <input type='number' name = 'planning[periods_attributes][" + $(".add-period").attr("id") + "][value_planned]' id='value-planned'></div>")
	$("#period-to-be-removed").css({"opacity":"0.0"})
	$("#period-to-be-removed").animate({opacity:"1.0"}, 300)

	$(".add-period").attr("id", parseInt($(".add-period").attr("id"), 10) + 1);

$("#remove-period").click ->
	$("#period-to-be-removed").animate({opacity:"0.0"}, 300, ->
		$("#period-to-be-removed").remove()
		$("#period-to-be-removed2").remove()
		$("div #period-not-to-be-removed").last().attr({"id":"period-to-be-removed"})
		$("div #period-not-to-be-removed2").last().attr({"id":"period-to-be-removed2"})
	)
	$(".add-period").attr("id", parseInt($(".add-period").attr("id"), 10) - 1);