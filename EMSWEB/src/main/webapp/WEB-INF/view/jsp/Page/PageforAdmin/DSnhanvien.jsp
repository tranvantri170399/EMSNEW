<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>AdminLTE 2 | Dashboard</title>

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>

<!-- modal -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {
		$('#table1').DataTable();
	});
</script>

<style type="text/css">
</style>
</head>
<body>
	<form:form action="/save" modelAttribute="staff">
		<!-- The Modal -->
		<%--   <div class="modal" id="myModal">
    <div class="modal-dialog">
      <div class="modal-content">
      
        Modal Header
        <div class="modal-header">
          <h4 class="modal-title">Update Staff</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        Modal body
        <div class="modal-body">
          <c:if test="${not empty List}">
				<c:forEach var="sp" items="${List}">
					<tr>
						<td>${sp.id}</td>
						<td>${sp.fname}</td>
						<td>${sp.lname}</td>
						<td>${sp.depart.name}</td>
						<td>${sp.role.roleName}</td>
						<td>${sp.image}</td>
						<td>${sp.email}</td>
						<td>${sp.dob}</td>
						<td>${sp.phone}</td>
						<td>${sp.address}</td>
						<td>${sp.status}</td>
						<td>${sp.level}</td>
						<td>${sp.salary}</td>
						<td style="text-align: center;">
							<input type="button" data-toggle="modal" data-target="#myModal" value="update">
							<input type="button" value="del">
						</td>
					</tr>
				</c:forEach>
			</c:if>
          
        </div>
        
        Modal footer
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary">Save changes</button>
        </div>
        
      </div>
    </div>
  </div>
   --%>
		<!--  -->

		<div class="modal fade" id="gfgmodal" tabindex="-1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<!-- MODEL TITLE -->
						<h2 class="modal-title" id="gfgmodallabel">Update Staff</h2>
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true"> ×</span>
						</button>
					</div>
					<!-- MODEL BODY -->
					<div class="modal-body">
						<div class="GFGclass" id="divGFG"></div>
						
						<div class="modal-footer">
							<!-- The close button in the bottom of the modal -->
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
							<button type="button" class="btn btn-primary">Save
								changes</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--Table  -->
		<table id="table1" class="display">

			<thead>
				<tr>
					<th>ID</th>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Depart</th>
					<!-- <th>Role</th>
				<th>Image</th>
				<th>Email</th>
				<th>Birthday</th>
				<th>Phone</th> -->
					<!-- 				<th>Address</th>
				<th>Status</th>
				<th>Level</th>
				<th>Salary</th> -->
					<th>Action</th>
				</tr>
			</thead>

			<tbody>
				<c:if test="${not empty List}">
					<c:forEach var="sp" items="${List}">
						<tr>
							<td class="gfgusername">${sp.id}</td>
							<td class="gfgpp">${sp.fname}</td>
							<td class="gfgscores">${sp.lname}</td>
							<td class="gfgarticles">${sp.depart.name}</td>
							<%-- <td>${sp.role.roleName}</td>
						<td>${sp.image}</td>
						<td>${sp.email}</td>
						<td>${sp.dob}</td>
						<td>${sp.phone}</td> --%>
							<%-- <td>${sp.address}</td>
						<td>${sp.status}</td>
						<td>${sp.level}</td>
						<td>${sp.salary}</td> --%>
							<td style="text-align: center;">
								<!-- <input  type="button" data-toggle="modal" data-target="#myModal" value="update"> -->
								<input type="button" class="gfgselect" data-toggle="modal"
								data-target="#gfgmodal" value="update"> <input
								class="gfgselect" data-toggle="modal" data-target="#gfgmodal"
								type="button" value="del">
							</td>
						</tr>
					</c:forEach>
				</c:if>

			</tbody>


		</table>


	</form:form>
<%-- 	<div>
		<form:form action="/save" modelAttribute="staff">
			<div style="width: 500px; height: 100px; margin-left: 100px;">
				<div style="float: none;">id</div>
				<div style="float: left;">
					<form:input path="id" cssStyle="width: 300px; height: 60px;" />
				</div>
			</div>
			<div style="width: 500px; height: 100px; margin-left: 100px;">
				<div style="float: none;">Depart</div>
				<div style="float: left;">
					<form:select path="depart.id"
						cssStyle="width: 300px; height: 60px;">
						<c:forEach items="${departs}" var="depart">
							<option
								<c:if test="${depart.name eq u.depart.name}">selected="selected"</c:if>
								value="${depart.id}">${depart.name}</option>
						</c:forEach>
					</form:select>
				</div>
			</div>
			<div style="width: 500px; height: 100px; margin-left: 100px;">
				<div style="float: none;">Role</div>
				<div style="float: left;">
					<form:select path="role.id" cssStyle="width: 300px; height: 60px;">
						<c:forEach items="${roles}" var="role">
							<option
								<c:if test="${role.name eq u.role.name}">selected="selected"</c:if>
								value="${role.id}">${role.name}</option>
						</c:forEach>
					</form:select>
				</div>
			</div>
			<div style="width: 500px; height: 100px; margin-left: 100px;">
				<div style="float: none;">Firstname</div>
				<div style="float: left;">
					<form:input path="fname" cssStyle="width: 300px; height: 60px;" />
				</div>
			</div>
			<div style="width: 500px; height: 100px; margin-left: 100px;">
				<div style="float: none;">Lastname</div>
				<div style="float: left;">
					<form:input path="lname" cssStyle="width: 300px; height: 60px;" />
				</div>
			</div>
			<div style="width: 500px; height: 100px; margin-left: 100px;">
				<div style="float: none;">Images</div>
				<div style="float: left;">
					<form:input path="image" type="file"
						cssStyle="width: 300px; height: 60px;" />
				</div>
			</div>
			<div style="width: 500px; height: 100px; margin-left: 100px;">
				<div style="float: none;">Email</div>
				<div style="float: left;">
					<form:input path="email" cssStyle="width: 300px; height: 60px;" />
				</div>
			</div>
			<div style="width: 500px; height: 100px; margin-left: 100px;">
				<div style="float: none;">Birthday</div>
				<div style="float: left;">
					<form:input path="dob" cssStyle="width: 300px; height: 60px;" />
				</div>
			</div>
			<div style="width: 500px; height: 100px; margin-left: 100px;">
				<div style="float: none;">Phone</div>
				<div style="float: left;">
					<form:input path="phone" cssStyle="width: 300px; height: 60px;" />
				</div>
			</div>
			<div style="width: 500px; height: 100px; margin-left: 100px;">
				<div style="float: none;">Address</div>
				<div style="float: left;">
					<form:input path="address" cssStyle="width: 300px; height: 60px;" />
				</div>
			</div>
			<div style="width: 500px; height: 100px; margin-left: 100px;">
				<div style="float: none;">Status</div>
				<div style="float: left;">
					<form:input path="status" cssStyle="width: 300px; height: 60px;" />
				</div>
			</div>
			<div style="width: 500px; height: 100px; margin-left: 100px;">
				<div style="float: none;">Level</div>
				<div style="float: left;">
					<form:input path="level" cssStyle="width: 300px; height: 60px;" />
				</div>
			</div>
			<div style="width: 500px; height: 100px; margin-left: 100px;">
				<div style="float: none;">Salary</div>
				<div style="float: left;">
					<form:input path="salary" cssStyle="width: 300px; height: 60px;" />
				</div>
			</div>
			<br>

			<div style="margin-left: 50px;">
				<input type="submit" name="btnsave" value="SAVE">

			</div>
		</form:form>
	</div>
 --%>
	<script>
		$(function() {
			// ON SELECTING ROW 
			$(".gfgselect")
					.click(
							function() {
								//FINDING ELEMENTS OF ROWS AND STORING THEM IN VARIABLES 
								var a = $(this).parents("tr").find(
										".gfgusername").text();
								var c = $(this).parents("tr").find(".gfgpp")
										.text();
								var d = $(this).parents("tr")
										.find(".gfgscores").text();
								var e = $(this).parents("tr").find(
										".gfgarticles").text();
								var p = "";
								// CREATING DATA TO SHOW ON MODEL 
								p += "<p id='a' name='GFGusername' >GFG UserHandle: "
										+ a + " </p>";

								p += "<p id='c' name='GFGpp'>Practice Problems: "
										+ c + "</p>";
								p += "<p id='d' name='GFGscores' >Coding Score: "
										+ d + " </p>";
								p += "<p id='e' name='GFGcoding' >GFG Article: "
										+ e + " </p>";
								//CLEARING THE PREFILLED DATA 
								$("#divGFG").empty();
								//WRITING THE DATA ON MODEL 
								$("#divGFG").append(p);
							});
		});
	</script>

</body>
</html>
