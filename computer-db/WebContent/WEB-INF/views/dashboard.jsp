<jsp:include page="include/header.jsp" />
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="fr.epf.computerdatabase.domain.Computer"%>

<div id="carousel-example-generic" class="carousel slide"
	data-ride="carousel">
	<!-- Indicators -->
	<ol class="carousel-indicators">
		<li data-target="#carousel-example-generic" data-slide-to="0"
			class="active"></li>
		<li data-target="#carousel-example-generic" data-slide-to="1"></li>
		<li data-target="#carousel-example-generic" data-slide-to="2"></li>
		<li data-target="#carousel-example-generic" data-slide-to="3"></li>
		<li data-target="#carousel-example-generic" data-slide-to="4"></li>
		<li data-target="#carousel-example-generic" data-slide-to="5"></li>
		<li data-target="#carousel-example-generic" data-slide-to="6"></li>
		<li data-target="#carousel-example-generic" data-slide-to="7"></li>
		<li data-target="#carousel-example-generic" data-slide-to="8"></li>
		<li data-target="#carousel-example-generic" data-slide-to="9"></li>

	</ol>

	<!-- Wrapper for slides -->
	<div class="carousel-inner">
		<c:forEach var="i" begin="0" end="9">
			<div class="item" id="${i}">
				<img src="http://lorempixel.com/1100/400/cats/${i+1}" width="100%"
					height="auto" alt="...">
				<div class="carousel-caption">
					<h3></h3>
					<p></p>
				</div>
			</div>
		</c:forEach>
	</div>
	<script>
	$("#0").addClass("active");	
	</script>
	<!-- Controls -->
	<a class="left carousel-control" href="#carousel-example-generic"
		role="button" data-slide="prev"> <span
		class="glyphicon glyphicon-chevron-left"></span>
	</a> <a class="right carousel-control" href="#carousel-example-generic"
		role="button" data-slide="next"> <span
		class="glyphicon glyphicon-chevron-right"></span>
	</a>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<h1 id="homeTitle">0 Computers on this page</h1>
		</div>
	</div>
	<div class="row" id="actions">
		<div class="col-md-6">
			<input type="search" id="searchbox" name="search"
				class="form-control col-md-4" value="" placeholder="Search name">
		</div>
		<button id="search"
			class="col-md-1 btn btn-default glyphicon glyphicon-search pull-left"
			onclick="string='/computer-db/dashboard?p=0&orderby=${orderby}&order=${order}&search=';
				string2=$('#searchbox').val();
			fin=string.concat(string2);
			window.location=fin;">
			Search</button>
	</div>

	<div class="row" style="margin-top:15px;">
		<div class="col-md-12">
			<table class="computers table table-striped table-bordered">
				<thead>
					<tr>
						<!-- Variable declarations for passing labels as parameters -->
						<!-- Table header for Computer Name -->
						<th><a
							href="http://localhost:8080/computer-db/dashboard?p=0&orderby=name&order=desc&search=${query}#homeTitle"
							class="glyphicon glyphicon-arrow-up"></a> <a
							href="http://localhost:8080/computer-db/dashboard?p=0&orderby=name&order=asc&search=${query}#homeTitle"
							class="glyphicon glyphicon-arrow-down"></a> Computer Name <a
							href="/computer-db/addComputer" class="glyphicon glyphicon-plus" /></th>

						<th><a
							href="http://localhost:8080/computer-db/dashboard?p=0&orderby=introduced&order=desc&search=${query}#homeTitle"
							class="glyphicon glyphicon-arrow-up"> <a
								href="http://localhost:8080/computer-db/dashboard?p=0&orderby=introduced&order=asc&search=${query}#homeTitle"
								class="glyphicon glyphicon-arrow-down"></a> Introduced Date</th>
						<!-- Table header for Discontinued Date -->
						<th><a
							href="http://localhost:8080/computer-db/dashboard?p=0&orderby=discontinued&order=desc&search=${query}#homeTitle"
							class="glyphicon glyphicon-arrow-up"> <a
								href="http://localhost:8080/computer-db/dashboard?p=0&orderby=discontinued&order=asc&search=${query}#homeTitle"
								class="glyphicon glyphicon-arrow-down"> </a> Discontinued Date</th>
						<!-- Table header for Company -->
						<th><a
							href="http://localhost:8080/computer-db/dashboard?p=0&orderby=company.name&order=desc&search=${query}#homeTitle"
							class="glyphicon glyphicon-arrow-up"> <a
								href="http://localhost:8080/computer-db/dashboard?p=0&orderby=company.name&order=asc&search=${query}#homeTitle"
								class="glyphicon glyphicon-arrow-down"> </a>Company <a
								onclick="$('#addCompany').modal('show');"
								style="cursor: pointer; text-decoration: none;"
								class="glyphicon glyphicon-plus" /></th>
						<th><span>Edit/Delete</span></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${computers}" var="computer">
						<tr>
							<td>${computer.name}</td>
							<td>${computer.introduced}</td>
							<td>${computer.discontinued}</td>
							<td>${computer.company.name}</td>
							<td><span style="padding: 5px; cursor: pointer;"
								title="Edit" class="glyphicon glyphicon-edit"
								onclick="introduced='${computer.introduced}';discontinued='${computer.discontinued}';	
																					   $('#modify').modal('show');
																					   $('#name').val('${computer.name}');
																					   $('#discontinued').val(discontinued.substring(0,10));
																					   $('#introduced').val(introduced.substring(0,10));
																					   $('#company').val('${computer.company.id}');
																					   $('#hidden_id').val('${computer.id}');
																					   "></span>


								<span data-toggle="modal" data-target="#myModal" title="Delete"
								style="cursor: pointer; padding: 5px;"
								class="glyphicon glyphicon-trash"
								onclick="		$('#modal-body').html('Are you sure you would like to delete');
								$('#modal-body').append(' <b>${computer.company.name} ${computer.name}</b> from this database permanently?');
												$('#btn').unbind();
												$('#btn').bind('click',function(){$.ajax({
													  type: 'POST',
													  url: '/computer-db/delete',
													  data: {'id':${computer.id}}
													}).done(function( msg ) {
													   $('#done').modal('show');
													   setTimeout(function() {$('#done').modal('hide');}, 3000);
													  });});"></span>
								</tdh>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</table>

<ul class="pagination" style="position:relative;">
	<li><a
		href="http://localhost:8080/computer-db/dashboard?p=${previousPage}&orderby=${orderby}&order=${order}&search=${query}#homeTitle">&laquo;</a></li>

	<c:forEach begin="0" end="${numberOfPages}" var="numberOfPages">
		<li id="pag_${numberOfPages}"><a
			href="http://localhost:8080/computer-db/dashboard?p=${numberOfPages}&orderby=${orderby}&order=${order}&search=${query}#homeTitle">${numberOfPages}</a></li>
	</c:forEach>

	<li><a
		href="http://localhost:8080/computer-db/dashboard?p=${nextPage}&orderby=${orderby}&order=${order}&search=${query}#homeTitle">&raquo;</a></li>
</ul>

<!-- Once table has loaded, we can generate the random computer names for carousel -->
<script>
	for (i = 0; i < 10; i++) {
		r = Math.floor(Math.random() * $("tbody tr").size());
		$("#" + i + " .carousel-caption h3").html(
				$($('tbody tr')[r]).children()[3].innerHTML + " - "
						+ $($('tbody tr')[r]).children()[0].innerHTML);
		$("#" + i + " .carousel-caption p").html(
				$($('tbody tr')[r]).children()[1].innerHTML + " - "
						+ $($("tbody tr")[r]).children()[2].innerHTML);

	}
	//Lets set the "active" for the one we have selected :D
	//First get teh page you are on
	function gup(name) {
		name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
		var regexS = "[\\?&]" + name + "=([^&#]*)";
		var regex = new RegExp(regexS);
		var results = regex.exec(window.location.href);
		if (results == null)
			return null;
		else
			return results[1];
	}
	p = gup("p");
	$("#pag_" + p).addClass("active");
</script>

<!-- Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">Warning!</h4>
			</div>
			<div id="modal-body" class="modal-body">Are you sure you would
				like to delete</div>
			<div class="modal-footer">
				<button type="button"
					class="btn btn-default glyphicon glyphicon-undo"
					data-dismiss="modal">Cancel</button>
				<button id="btn" type="button" data-dismiss="modal"
					class="btn btn-danger glyphicon glyphicon-trash">Confirm</button>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="done" tabindex="-1" role="dialog"
	aria-labelledby="doneLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="doneLabel">Operation successful!</h4>
			</div>
			<div class="modal-body">Thank you for your input, please come
				again.</div>
		</div>
	</div>
</div>
<div class="modal fade" id="modify" tabindex="-1" role="dialog"
	aria-labelledby="doneLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="doneLabel">Modification</h4>
			</div>
			<div class="modal-body">

				<form id="updateForm" role="form"
					action="/computer-db/updateController" method="POST">
					<div class="form-group">
						<label for="name">Computer name</label> <input type="text"
							class="form-control" name="name" id="name"
							placeholder="Enter name">
						<p class="help-block">Required</p>
					</div>
					<span class="label label-warning">Changing the introduction
						and discontinuation dates is currently unavailable (blame
						Hibernate)</span> <br> <br>
					<div class="form-group">
						<label for="company">Company Name:</label>
						<div class="input">
							<select name="company" id="company" class="form-control">
								<c:forEach items="${companies}" var="company">
									<!--  -->
									<option value="${company.id}">${company.name}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					<input type="hidden" name="hidden_id" id="hidden_id"></input>
					<div class="actions">
						<button id="updateComputer" type="submit" class="btn btn-success">Submit</button>
						or <a class="btn btn-danger" id="cancel"
							onclick="$('#modify').modal('hide');">Cancel</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="modal fade" id="addCompany" tabindex="-1" role="dialog"
	aria-labelledby="doneLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title" id="doneLabel">Add a company</h4>
			</div>
			<div class="modal-body">

				<form id="addCompanyForm" role="form"
					action="/computer-db/addCompany" method="POST">
					<div class="form-group">
						<label for="name">Name</label> <input type="text"
							class="form-control" name="name" id="companyName"
							placeholder="Enter company name">
						<p class="help-block">Required</p>
					</div>
					<div class="actions">
						<button id="updateComputer" type="submit" class="btn btn-success">Submit</button>
						or <a class="btn btn-danger" id="cancel"
							onclick="$('#addCompany').modal('hide');">Cancel</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
$(document).ready(function() {
    // Lorsque je soumets le formulaire
    $('#updateForm').on('submit', function(e) {
        e.preventDefault(); // J'empêche le comportement par défaut du navigateur, c-à-d de soumettre le formulaire
 
        var $this = $(this); // L'objet jQuery du formulaire
 
        // Je récupère les valeurs
        var name = $('#name').val();
        var company = $('#company').val();
        var id = $('#hidden_id').val();
        
            // Envoi de la requête HTTP en mode asynchrone
            $.ajax({
                url: $this.attr('action'), // Le nom du fichier indiqué dans le formulaire
                type: $this.attr('method'), // La méthode indiquée dans le formulaire (get ou post)
                data: $this.serialize()});
            $('#modify').modal('hide');
            $('#done').modal('show');
			   setTimeout(function() {$('#done').modal('hide');}, 3000);

        
    });
});
</script>
<script>
$(document).ready(function() {
    // Lorsque je soumets le formulaire
    $('#addCompanyForm').on('submit', function(e) {
        e.preventDefault(); // J'empêche le comportement par défaut du navigateur, c-à-d de soumettre le formulaire
 
        var $this = $(this); // L'objet jQuery du formulaire
 
        // Je récupère les valeurs
        var name = $('#companyName').val();        
            // Envoi de la requête HTTP en mode asynchrone
            $.ajax({
                url: $this.attr('action'), // Le nom du fichier indiqué dans le formulaire
                type: $this.attr('method'), // La méthode indiquée dans le formulaire (get ou post)
                data: $this.serialize()});
            $('#addCompany').modal('hide');
            $('#addCompany').modal('hide');
            $('#done').modal('show');
			   setTimeout(function() {$('#done').modal('hide');}, 3000);


    });
});
</script>
<!-- INIT THE VAL -->
<script>$('#homeTitle')[0].innerHTML=$('table tr').length-1+" computers on this page.";</script>

<jsp:include page="include/footer.jsp" />
