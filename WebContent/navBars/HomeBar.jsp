<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>



<!DOCTYPE html>
<html lang="en">
<head>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
    var createAllErrors = function() {
        var form = $( this ),
            errorList = $( "ul.errorMessages", form );

        var showAllErrorMessages = function() {
            errorList.empty();

            var invalidFields = form.find( ":invalid" ).each( function( index, node ) {
                var label = $( "label[for=" + node.id + "] "),
                    message = node.validationMessage || 'Invalid value.';

                errorList
                    .show()
                    .append( "<li><span>" + label.html() + "</span> " + message + "</li>" );
            });
        };

        form.on( "submit", function( event ) {
            if ( this.checkValidity && !this.checkValidity() ) {
                $( this ).find( ":invalid" ).first().focus();
                event.preventDefault();
            }
        });

        $( "input[type=submit], button:not([type=button])", form )
            .on( "click", showAllErrorMessages);

        $( "input", form ).on( "keypress", function( event ) {
            var type = $( this ).attr( "type" );
            if ( /date|email|month|number|search|tel|text|time|url|week/.test ( type )
              && event.keyCode == 13 ) {
                showAllErrorMessages();
            }
        });
    };
    
    $( "form" ).each( createAllErrors );
</script>

<style>
.errorMessages{
	color: red;
	font-weight: bold;
	list-style-type: none;
}
</style>
</head>

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
			<a href="index.jsp"
				class="navbar-brand"><img
				src="download.png"
				class="img-rounded" alt="my book" width="75px" height="20px"></a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav">
				<li><a href="index.jsp">Home</a></li>
				<!-- <li><a href="About.html">About</a></li> -->
				<li><a href="Contact.jsp">Contact</a></li>
				<!-- <li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">Books <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="AllBooks.html">All Books</a></li>
							<li><a href="#">Author Section</a></li>
						<li><a href="#">Something else here</a></li> 
						<li role="separator" class="divider"></li>
						<li class="dropdown-header">For Authors</li>
						<li><a href="#">Add Books</a></li>
						<li><a href="#">Modify Books</a></li>
					</ul></li> -->
			</ul>
			<form class="navbar-form navbar-right">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Search">
				</div>
				<button type="submit" class="btn btn-outline-success my-2 my-sm-0">Submit</button>
			</form>

			<ul class="nav navbar-nav navbar-right">
				<li><a class="glyphicon glyphicon-user" role="button"
					data-toggle="modal" data-target="#myModalR"> Register </a></li>
				<li><a class="glyphicon glyphicon-log-in" role="button"
					data-toggle="modal" data-target="#myModalL"> Login </a></li>
			</ul>

			<div class="modal fade" id="myModalR" role="dialog">
				<div class="modal-dialog">
					Modal content
					<div class="modal-content">
						<div class="modal-body">
							<form class="form-signin" method="post" action="register">
							<ul class="errorMessages" style=></ul>
								<h2 class="form-signin-heading" style="text-align: center">Register</h2>
								<br style="display: block margin: 1px 0"> <label
									for="inputUsername" class="sr-only">Email address</label> <input
									type="text" id="inputUsername" class="form-control"
									placeholder="UserName" name="userName" required autofocus>
								<label for="inputPassword" class="sr-only">User Name</label> <br
									style="display: block margin: 1px 0"> <input
									type="password" id="inputPassword" class="form-control"
									placeholder="Password" name="password" required> <label
									for="inputEmail" class="sr-only">Password</label> <br
									style="display: block margin: 1px 0"> <input type="email"
									id="inputEmail" class="form-control"
									placeholder="Email address" name="email" required autofocus>
								<br style="display: block margin: 1px 0"> <label
									class="radio-inline"> <input type="radio"
									name="optradio" value="publisher">Publisher
								</label> <label class="radio-inline"> <input type="radio"
									name="optradio" value="reader">Reader
								</label> <br style="display: block margin: 1px 0"> <input
									class="btn btn-lg btn-primary btn-block" type="submit"
									value="register" required>
							</form>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>

			<div class="modal fade" id="myModalL" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-body">
							<form class="form-signin" method="post" action="login">
								<ul class="errorMessages" style=></ul>
								<h2 class="form-signin-heading" style="text-align: center">Login</h2>
								<label for="inputUsername" class="sr-only">Email address</label>
								<br style="display: block margin: 1px 0"> <input
									type="text" id="inputUsername" class="form-control"
									placeholder="UserName" name="userName" required autofocus>
								<label for="inputPassword" class="sr-only">Password</label> <br
									style="display: block margin: 1px 0"> <input
									type="password" id="inputPassword" class="form-control"
									placeholder="Password" name="password" required> <br
									style="display: block margin: 1px 0"> 
									<a href="#" ><input
									class="btn btn-lg btn-primary btn-block" type="submit"
									value="submit"></a>
															

							</form>

							<!-- <a href=testWeb.html role="button" type="submit">Continue as
								Guest</a> -->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal">Close</button>
						</div>
					</div>

				</div>
			</div>
		</div>

	</div>
</body>
</html>