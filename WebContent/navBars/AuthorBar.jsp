<!DOCTYPE html>
<html lang="en">


<body>
	<!-- Static navbar -->
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a href="index.jsp" class="navbar-brand"><img
				src="download.png"
				class="img-rounded" alt="my book" width="45px" height="25px"></a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Books <span class="caret"></span></a>
					<ul class="dropdown-menu">
					<!-- 	<li><a href="#">Author Section</a></li>
						<li><a href="#">Something else here</a></li>  -->
						<li role="separator" class="divider"></li>
						<li class="dropdown-header">For Authors</li>
						<li><a href="addBook.jsp">Add Books</a></li>
						<li><a href="getAuthorBooks">View Books</a></li>
					</ul></li> 
			</ul>
			<!--<form class="navbar-form navbar-right">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-default">Submit</button>
			</form> -->
			 <ul class="nav navbar-nav navbar-right">
				<li><a href="index.jsp"><span class="glyphicon glyphicon-log-out"
						role="button"> Logout </span> </a></li>
			</ul>
		</div>

	</div>

</body>
</html>