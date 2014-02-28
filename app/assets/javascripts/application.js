// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require hoverIntent
//= require_tree .

function remove_fields(link) {
	$(link).previous("input[type=hidden]").value = "1";
	$(link).up(".fields").hide();
}

function add_fields(link, association, content) {
	var new_id = new Date().getTime();
	var regexp = new RegExp("new_" + association, "g")
	$(link).up().insert({
		before: content.replace(regexp, new_id)
	});
}

window.onload = function () {
	
	function draw_chart (texto, dados, dados2, dados3, dados4) {

		var chart = new CanvasJS.Chart("chart_container", {            
			title:{
				text: texto
			},

			data: [
			{
				type: "column",
				name: "First Quarter",
				dataPoints: dados
			},
			{
				type: "column",
				name: "Second Quarter",
				dataPoints: dados2
			},
			{
				type: "line",
				name: "Terceiro Quarter",
				dataPoints: dados3
			},
			{
				type: "line",
				name: "Terceiro Quarter",
				dataPoints: dados4
			}
			]
		});


		chart.options.data[0].color = "red";
		chart.options.data[2].color = "blue";
		chart.options.data[1].color = "blue";
		chart.options.data[3].color = "red";
		
		chart.render();
	}

	var id = 1;
	$("#show_chart").find("div").map(function() {
		id = this.id.split("_")[1];
	});

	$('#show_chart').on('click', function (e) {
		$.get("/ajax/subsub_data?id="+id, function (json) {
			draw_chart("Valores", json[0], json[1], json[2], json[3])
		});

		return false;
	
	});

	$.get("/ajax/subsub_data?id="+id, function (json) {

		draw_chart("Valores", json[0], json[1], json[2], json[3]);

	});
}