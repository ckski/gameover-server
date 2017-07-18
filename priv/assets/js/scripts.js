$(document).ready(function() {
    $("#refreshButton").click(function() {
		//server ip: 10.161.110.138
		$.get( "http://10.161.110.138/tables", function( data ) {
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