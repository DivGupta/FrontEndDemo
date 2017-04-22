<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@page import="com.fdm.library.Book"%>
<%@page import="com.fdm.library.Comment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
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
		$("#includedContent").load("navBars//UserBar.jsp");
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
<style>
.annoyingButton {
	height: 50px;
	width: 50px;
	position: fixed;
	bottom: 83%;
	width: 100%;
	text-align: right;
}

.annoyingButton2 {
	float: right;
	bottom: 0%;
	width: 100%;
}

div.stars {
	width: 270px;
	display: inline-block;
}

input.star {
	display: none;
}

label.star {
	float: right;
	padding: 10px;
	font-size: 36px;
	color: #444;
	transition: all .2s;
}

input.star:checked ~ label.star:before {
	content: '\f005';
	color: #FD4;
	transition: all .25s;
}

input.star-5:checked ~ label.star:before {
	color: #FE7;
	text-shadow: 0 0 20px #952;
}

input.star-1:checked ~ label.star:before {
	color: #F62;
}

label.star:hover {
	transform: rotate(-15deg) scale(1.3);
}

label.star:before {
	content: '\f006';
	font-family: FontAwesome;
}
</style>
</head>
<body style="text-align: center">

	<div class="container-fullwidth">
		<nav class="navbar navbar-inverse">
			<div id="includedContent"></div>
		</nav>


		<form action="buyBooks" method="post">
			<div class="annoyingButton">
				<div class="annoyingButton2">
					<button class="btn btn-lg btn-success" role="button" type="submit"
						name="cart">Checkout</button>
				</div>
			</div>
			<%
				Book book = ((Book) session.getAttribute("book"));
				String cov = (String) session.getAttribute("cover");
			%>
			<div>
				<img src=<%=cov%>
					style="display: block; margin: auto; width: auto; height: 300px">
			</div>
			<div>
				<p>
					<strong>Title: </strong>
					<%=book.getTitle()%>
				</p>
				<br>
				<p>
					<strong>Author: </strong>
					<%=book.getAuthor()%></p>
				<br>
				<p>
					<strong>Genre: </strong>
					<%=book.getGenre()%></p>
				<br>
				<p style="word-wrap: break-word">
					<strong>Novel Rating: </strong>
					<%=book.getRating()%></p>

				<br>
				<p style="word-wrap: break-word">
					<strong>Novel Description: </strong>
					<%=book.getDesc()%></p>

			</div>
			<hr>

		</form>
		<hr>

		<br> <br>


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
