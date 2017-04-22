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
	$("#includedContent").load("navBars//AuthorBar.jsp");
	$("#bottom").load("navBars//BottomBar.jsp");
});
</script>
<!-- Bootstrap core CSS -->
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link href="../../assets/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="navbar.css" rel="stylesheet">

<link rel="stylesheet" type="text/css" href="newstyles.css"
	media="screen" />

<style>
.funFont {
	color: #333333;
	font-family: ‘Palatino Linotype’, ‘Book Antiqua’, Palatino, serif;
	font-weight: "bold";
}

hr {
	display: block;
	margin-top: 0.5em;
	margin-bottom: 0.5em;
	margin-left: 5em;
	margin-right: 5em;
	border-style: groove;
	border-width: 1px;
}
</style>

</head>

<body>

	<div class="container-fullwidth">
		<nav class="navbar navbar-inverse">
			<div id="includedContent"></div>
		</nav>


		<!-- Main component for a primary marketing message or call to action -->
		<div class="jumbotron" style="text-align: center">

			<!-- <h3 > Add books here </h3> -->

			<form>
				<h3 style="text-align: center" class="funFont">Please fill in
					the fields you would like modified</h3>
				<div class="form-group" style="margin-left: 15em; margin-right:15em">
					<input type="text" id="inputTitle" placeholder="Title (required)"
						style="text-align: center" required autofocus> <label
						for="inputTitle" class="sr-only"> Title (required) </label> <br> <br>
					<input type="text" id="inputTitle" placeholder="New Title"
						style="text-align: center" autofocus> <label
						for="inputTitle" class="sr-only"> Title </label> <br> <br>
					<input type="text" id="inputAuthor" placeholder="New Author"
						style="text-align: center" autofocus> <label
						for="inputTitle" class="sr-only"> Author </label> <br> <br>
					<input type="text" id="inputGenre" placeholder="New Genre"
						style="text-align: center" autofocus> <label for="Genre"
						class="sr-only"> Genre </label> <br> <br>
					<textarea maxlength="255" class="form-control" id="inputDesc"
						placeholder="New Novel Desciption" style="text-align: center"
						autofocus></textarea>
					<label for="inputDesc" class="sr-only"> Novel Desciption </label> <br>
				</div>
				<hr>

				<div>
					<span style="text-align: center" class="funFont"> Cover Page
						Image: <input style="margin-left: 45%" type="file" id="imageFile">
					</span> <br> <span style="text-align: center" class="funFont">Novel
						Text File: <input style="margin-left: 45%" type="file"
						id="textFile">
					</span>
				</div>

			</form>
			<br> <br>
			<div style="margin-left: 5em; margin-right: 5em;">
				<button type="submit" class="btn btn-primary btn-block">Submit</button>
			</div>
		</div>


	</div>
	<!-- /container -->


	<div id="bottom"></div>

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
