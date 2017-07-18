$(document).ready(function() {
    $("#refreshButton").click(function() {
		let server_address = window.location.origin;
		$.get( server_address + "/tables", function( data ) {
			console.log(data);
			let latest_activity = data.status.latest_activity;
			var d = new Date(latest_activity);
			$("#lastKnownActivity").html(d);
			
		});
		var d = new Date(latest_activity);
		$("#poolTableStatus").html("Available/Unavailable");
		$("#approxComplTime").html("XXX Minutes");
    });
});