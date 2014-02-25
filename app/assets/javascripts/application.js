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
	
	function draw_chart (texto, dados, dados2) {
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
				type: "line",
				name: "Second Quarter",
				dataPoints: dados2
			}
			]
		});

		chart.render();
	}

	$('#show_chart').on('click', function (e) {
			$.get("/subsubsystem/data_for_chart?id=1", function (json) {
                alert(json);
            });
		draw_chart("XD", [
        { x: 10, y: 71 },
        { x: 20, y: 55},
        { x: 30, y: 50 },
        { x: 40, y: 65 },
        { x: 50, y: 95 },
        { x: 60, y: 68 },
        { x: 70, y: 28 },
        { x: 80, y: 34 },
        { x: 90, y: 14}
        ], [
        { x: 10, y: 71 },
        { x: 20, y: 55},
        { x: 30, y: 50 },
        { x: 40, y: 65 },
        { x: 50, y: 95 },
        { x: 60, y: 68 },
        { x: 70, y: 28 },
        { x: 80, y: 34 },
        { x: 90, y: 14}
        ])
		return false;
	});
}