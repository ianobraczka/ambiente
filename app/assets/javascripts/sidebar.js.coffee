$("#sidebar").mouseenter ->
	$(this).animate({
		left:"0px",
		opacity:1.0
	}, 200)

$("#sidebar").mouseleave ->

	newLeft = "-" + ($(this).width() - 50) + "px"

	$(this).animate({
		left:newLeft,
		opacity:0.0
	}, 200)

$(".disclosure-indicator").click ->

	toggleID = $(this).attr("toggle_id")
	status = $(this).attr("status")

	if (status == "open")
		$(this).find("img").attr({"src":image_path("disclosure-indicator-closed.png")})
		$(this).attr({"status":"closed"})
		$("#"+toggleID).css("display":"none")
		$("#"+toggleID).attr({"status":"closed"})
	else
		$(this).find("img").attr({"src":image_path("disclosure-indicator-open.png")})
		$(this).attr({"status":"open"})
		$("#"+toggleID).css("display":"inline")
		$("#"+toggleID).attr({"status":"open"})

