$(document).ready(function() {
    $("#refreshButton").click(function() {
		let server_address = window.location.origin;
		$.get( server_address + "/tables", function( data ) {
			console.log(data);
			let latest_activity = data.status.latest_activity;
			var d = new Date(latest_activity * 1000);
			$("#lastKnownActivity").html(d.getHours() + ":" + d.getMinutes() + " " + d.toDateString());
		});
		var f = new Date();
		$("#lastRefresh").html(f.getHours() + ":" + f.getMinutes() + " " + f.toDateString());
		$("#poolTableStatus").html("Available/Unavailable");
		$("#approxComplTime").html("XXX Minutes");
    });
});