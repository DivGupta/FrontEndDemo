<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<%@page import="com.fdm.library.Book"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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

<link rel="stylesheet" type="text/css" href="newstyles.css"
	media="screen" />

<style>
.rig {
	list-style: none;
	font-size: 0px;
	margin-left: -1.875%;
	margin-right: 1.875%;
}

.rig li {
	display: inline-block;
	padding: 10px;
	margin: 0 0 1.875% 1.875%;
	background: #fff;
	border: 1px solid #ddd;
	font-size: 16px;
	font-size: 1rem;
	vertical-align: top;
	box-shadow: 0 0 5px #ddd;
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
}

.rig li img {
	max-width: 100%;
	height: auto;
	margin: 0 0 10px;
}

.rig li h3 {
	margin: 0 0 5px;
}

.rig li p {
	font-size: .9em;
	line-height: 1.5em;
	color: #999;
}

.rig.columns-3 li {
	width: 30.83%;
}

.columns {
	
}

@media ( max-width : 480px) {
	.grid-nav li {
		display: block;
		margin: 0 0 5px;
	}
	.grid-nav li a {
		display: block;
	}
	.rig {
		margin-left: 0;
	}
	.rig li {
		width: 100% !important;
		margin: 0 0 20px;
	}
}

.temp {
	columns: 3;
}
</style>
</head>
<body>
	<div class="container-fullwidth">
		<nav class="navbar navbar-inverse">
			<div id="includedContent"></div>
		</nav>

		<!-- Main component for a primary marketing message or call to action -->
		<div class="jumbotron">
			<form action="getBooks" method="post">
				<ul class="rig columns-3">

					<li>
							<c:set var="book" scope="session" value="${book0}"/>
							<c:set var="cov" scope="session" value="${cover0}"/>
						
						<div>
							<a href="books?cur=0"><img
								src="${cov}"></a>
						</div>
						<div>

							<p> 
								<strong>Title: </strong>
								${book.getTitle()}
							</p>
							<p>
								<strong>Author:</strong>
								${book.getAuthor()}</p>
							<p>
								<strong>Genre:</strong>
								${book.getGenre()}</p>
							<p style="word-wrap: break-word">
								<strong>Novel Rating: </strong>
								${book.getRating()}</p>
							<p style="word-wrap: break-word">
								<strong>Description of novel</strong>
								<${book.getDesc()}</p>


						</div>

					</li>
					<li>

						<c:set var="book" scope="session" value="${book1}"/>
						<c:set var="cov" scope="session" value="${cover1}"/>

						<div>
							<a href="books?cur=1"><img src="${cov}"></a>
						</div>
						<div>

							<p> 
								<strong>Title: </strong>
								${book.getTitle()}
							</p>
							<p>
								<strong>Author:</strong>
								${book.getAuthor()}</p>
							<p>
								<strong>Genre:</strong>
								${book.getGenre()}</p>
							<p style="word-wrap: break-word">
								<strong>Novel Rating: </strong>
								${book.getRating()}</p>
							<p style="word-wrap: break-word">
								<strong>Description of novel</strong>
								<${book.getDesc()}</p>


						</div>
					</li>


					<li>
						<c:set var="book" scope="session" value="${book2}"/>
						<c:set var="cov" scope="session" value="${cover2}"/>
						<div>
							<a href="books?cur=2"><img src="${cov}"></a>
						</div>
						<div>

							<p> 
								<strong>Title: </strong>
								${book.getTitle()}
							</p>
							<p>
								<strong>Author:</strong>
								${book.getAuthor()}</p>
							<p>
								<strong>Genre:</strong>
								${book.getGenre()}</p>
							<p style="word-wrap: break-word">
								<strong>Novel Rating: </strong>
								${book.getRating()}</p>
							<p style="word-wrap: break-word">
								<strong>Description of novel</strong>
								<${book.getDesc()}</p>


						</div>
					</li> 

				</ul>


				<div style="margin-left: 49%">

					<span><button type="submit" style="outline: none"
							name="bkward">
							<span class="glyphicon glyphicon-step-backward"></span>
						</button>
						<button type="submit" style="outline: none" name="fward">
							<span class="glyphicon glyphicon-step-forward"></span>
						</button></span>
				</div>
			</form>

		</div>


	</div>
	<div id="bottom"></div>
	<!-- /container -->
</body>
