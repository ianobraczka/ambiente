root = exports ? this

$("#sidebar").mouseenter ->
	$(this).animate({
		left:"0px",
		opacity:1.0
	}, 200)

$("#sidebar").mouseleave ->
	$(this).animate({
		left:"-293px",
		opacity:0.0
	}, 200)

root.toggle = (id) ->

	element = $("#"+id)

	if element.attr("status") == "open"
		element.css("display":"inline")
		element.attr({"status":"closed"})
	else
		element.css("display":"none")
		element.attr({"status":"open"})