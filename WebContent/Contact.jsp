<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="http://code.jquery.com/jquery-3.1.1.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
$(function() {
	$("#includedContent").load("navBars/HomeBar.jsp");
	$("#bottom").load("navBars/BottomBar.jsp");
});

	$(document).ready(function() {
		animateDiv();

	});

	function makeNewPosition() {

		var h = $(window).height() - 50;
		var w = $(window).width() - 50;

		var nh = Math.floor(Math.random() * h);
		var nw = Math.floor(Math.random() * w);

		return [ nh, nw ];

	}

	function animateDiv() {
		var newq = makeNewPosition();
		$('.a').animate({
			top : newq[0],
			left : newq[1]
		}, function() {
			animateDiv();
		});

	};
</script>

<!-- Bootstrap core CSS -->
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="../../assets/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="navbar.css" rel="stylesheet">
<style>
div.a {
	width: 40rem;
	height: 20rem;
	background-color: lightgrey;
	position: fixed;
}

@media screen and ( min-width : 720px) {
	div.a {
		width: 40rem;
		height: 20rem;
		background-color: rgba(255,255,255,0);
		position: fixed;
	}
}
#modal-backdrop {
   background-color: black	;
}
</style>

</head>

<body>

	<div class="container-fullwidth">
		<nav class="navbar navbar-inverse">
			<div id="includedContent"></div>
		</nav>

		<div class="a" style="text-align	:center">

			<a href="#"><h1>YOU'LL NEVER FIND ME</h1></a> 
			<!-- <a href="#"> <h2>HAHAHAHAHAHHAHAHA</h2> -->
			</a>


		</div> 
		<div id="bottom"></div>
	</div>
	<!-- /container -->


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		window.jQuery
				|| document
						.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')
	</script>
	<script src="../../dist/js/bootstrap.min.js"></script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
