<link rel="stylesheet" type="text/css" href="{{$baseurl}}/vendor/asset/fullcalendar/dist/fullcalendar.min.css" />
<link rel="stylesheet" type="text/css" href="{{$baseurl}}/vendor/asset/fullcalendar/dist/fullcalendar.print.min.css" />
<script type="text/javascript" src="{{$baseurl}}/vendor/asset/moment/min/moment-with-locales.min.js"></script>
<script type="text/javascript" src="{{$baseurl}}/vendor/asset/fullcalendar/dist/fullcalendar.min.js"></script>
<script type="text/javascript" src="{{$baseurl}}/library/moment/moment.min.js"></script>
<script>
	// start calendar from yesterday
	var yesterday= new Date()
	yesterday.setDate(yesterday.getDate()-1)
	
	function showEvent(eventid) {
		$.get(
			'{{$baseurl}}/events/?id='+eventid,
			function(data){
				$.colorbox({html:data});
			}
		);
	}
	$(document).ready(function() {
		$('#events-reminder').fullCalendar({
			firstDay: yesterday.getDay(),
			year: yesterday.getFullYear(),
			month: yesterday.getMonth(),
			date: yesterday.getDate(),
			events: '{{$baseurl}}/events/json/',
			header: false,
			timeFormat: 'H(:mm)',
			defaultView: 'basicWeek',
			contentHeight: 75,
			eventClick: function(calEvent, jsEvent, view) {
				showEvent(calEvent.id);
			}
		});
	});
</script>
<div id="events-reminder" class="hidden-sm hidden-xs"></div>
<br class="hidden-sm">
