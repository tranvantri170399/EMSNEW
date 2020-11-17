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

<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Daterange picker -->
<link
	href="../../../../../resources/bootstrap/css/daterangepicker-bs3.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="../../../../../resources/bootstrap/css/AdminLTE.min.css"
	rel="stylesheet" type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the cs/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="../../../../../resources/bootstrap/css/_all-skins.min.css"
	rel="stylesheet" type="text/css" />



<script>
	$(document).ready(function() {
		$('#table1').DataTable();
	});
</script>

<style type="text/css">
</style>
</head>
<body>
<<<<<<< HEAD
	<section class="content-header">
		<h1>
			Danh Sách Nhân Viên
			<button type="button" class="btn btn-info" data-toggle="modal"
				data-target="#myModal">Thêm nhân viên</button>
		</h1>
		<ol class="breadcrumb">
			<li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
			<li class="active">Quản lí nhân viên</li>
			<li class="active">Danh sách Nhân Viên</li>
		</ol>
	</section>
	<!--Modalthemnhanvien-->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<form:form action="/save/staff" modelAttribute="staff">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Thêm Nhân Viên</h4>
				</div>
				<div class="modal-body">
					<div>
						
							<div class="form-group">
								<form:input type="text" path="id" />
							</div>
							<div Class="form-group">
								<label for="InputName">Họ và tên:</label>
								<div Class="input-group">
									<span Class="input-group-addon">Họ</span>
									<form:input type="text" path="lname" classxmlns="form-control"
										id="InputLastname" />
									<span Class="input-group-addon">Tên</span>
									<form:input type="text" path="fname" classxmlns="form-control"
										id="InputFirstname" />
								</div>
							</div>
							<div clas="form-group">
								<label for="InputID">Ngày sinh</label>
								<form:input type="date" path="dob" classxmlns="form-control"
									id="InputDob" min="1980-1-1" max="2020-12-31" />
							</div>
							<div clas="form-group">
								<label for="InputID">Số Điện Thoại</label>
								<form:input type="text" path="phone" classxmlns="form-control"
									id="InputPhone" />
							</div>
							<div clas="form-group">
								<label for="InputID">Địa chỉ:</label>
								<form:input type="text" path="address" classxmlns="form-control"
									id="InputAddress" />
							</div>
							<div clas="form-group">
								<label for="InputID">Trạng Thái:</label>
								<form:input path="status" classxmlns="form-control" />
							</div>
							<div clas="form-group">
								<label for="InputID">Cấp độ:</label>
								<form:input path="level" classxmlns="form-control" />
							</div>
							<div clas="form-group">
								<label for="InputID">Lương</label>
								<form:input path="salary" classxmlns="form-control" />
							</div>
							<div clas="form-group">
								<label for="InputID">Phòng Ban:</label>
								<form:select path="depart" classxmlxmlns="form-control"
									idxmlns="sel1">
									<c:if test="${not empty Listdp}">
										<c:forEach var="sp" items="${Listdp}">
											  <form:option value="${sp.name}" />
                     							<%--  <form:options items="${Listdp}" /> --%>
                     							 </c:forEach>
									</c:if>
								</form:select>
							</div>
							<div clas="form-group">
								<label for="InputID">Chức vụ</label>
								<form:select path="role" classxmlxmlns="form-control"
									idxmlns="sel1">
									<c:if test="${not empty Listr}">
										<c:forEach var="sp" items="${Listr}">
											<option>${sp.roleName}</option>
										</c:forEach>
									</c:if>
								</form:select>
							</div>
						
					</div>
				</div>
				<div class="modal-footer">
					<input type="submit" name="btnsave" class="btn btn-info"
						value="SAVE">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
				
			</div>
			</form:form>
		</div>
	</div>
	<!-- The Modal -->
	<%-- 		<div class="modal fade" id="gfgmodal" tabindex="-1" role="dialog">
=======
	    <section class="content-header">
        <h1>
            Danh Sách Nhân Viên 
            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Thêm nhân viên</button>
        </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
            <li class="active">Quản lí nhân viên</li>
            <li class="active">Danh sách Nhân Viên</li>
          </ol>
        </section>
        <!--Modalthemnhanvien-->
		<div class="modal fade" id="myModal" role="dialog">
    		<div class="modal-dialog">
    
   		   <!-- Modal content-->
      			<div class="modal-content">
        			<div class="modal-header">
          				<button type="button" class="close" data-dismiss="modal">&times;</button>
          				<h4 class="modal-title">Thêm Nhân Viên</h4>
        			</div>
        		<div class="modal-body">
          			<div>
						<form:form action="/save" modelAttribute="depart">
							<div class="form-group">
								<form:input path="id" type="hidden" class="form-control" />
							</div>
							<div class="form-group">
								<label for="InputName">Họ và tên:</label>
                    			<div class="input-group">
                      				<span class="input-group-addon">Họ</span> 
                      				<form:input type="text" class="form-control disabled" id="InputLastname" >
                      				<span class="input-group-addon">Tên</span> 
                      				<form:input type="text" class="form-control disabled"  id="InputFirstname" >            
                    </div>
							</div>
							<div clas="form-group">
								<label for="InputID">Ngày sinh</label>
								<form:input path="id" class="form-control" />
							</div>
							<div clas="form-group">
								<label for="InputID">Số Điện Thoại</label>
								<form:input path="id" class="form-control" />
							</div>
							<div clas="form-group">
								<label for="InputID">Địa chỉ:</label>
								<form:input path="id" class="form-control" />
							</div>
							<div clas="form-group">
								<label for="InputID">Trạng Thái:</label>
								<form:input path="id" class="form-control" />
							</div>
							<div clas="form-group">
								<label for="InputID">Cấp độ:</label>
								<form:input path="id" class="form-control" />
							</div>
							<div clas="form-group">
								<label for="InputID">Lương</label>
								<form:input path="id" class="form-control" />
							</div>
							<div clas="form-group">
								<label for="InputID">Phòng Ban:</label>
								<form:select path="depart" items="${departList}" />
      							</select>
							</div>
							<div clas="form-group">
								<label for="InputID">Chức vụ</label>	
								<form:select path="role" items="${roleList}" />
							</div>												
						</form:form>
					</div>
       			</div>
        		<div class="modal-footer">
        			<input type="submit" name="btnsave" class="btn btn-info" value="SAVE">	
          			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        		</div>
      		</div>
      	</div>
  	</div>        	
        <!-- -->
		<!-- The Modal -->
		<div class="modal fade" id="gfgmodal" tabindex="-1" role="dialog">
>>>>>>> master
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
					<form action="/update/staff">
						<div class="GFGclass" id="divGFG"></div>
						
						<div class="modal-footer">
							<!-- The close button in the bottom of the modal -->
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Close</button>
								<input type="submit" class="btn btn-primary" value="Save changes"> 
						</div>
					</form>
					</div>
				</div>
			</div>
		</div> --%>
	<!--Table  -->
	<form:form action="/save" modelAttribute="staff">
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
<<<<<<< HEAD
								<input type="button" class="gfgselect" data-toggle="modal"
								data-target="#gfgmodal" value="update"> <input
=======
								<input type="button" class="gfgselect" data-toggle="modal" href="UpdateNhanvien.jsp"
								data-target="#gfgmodal" value="Update"> 
								<input
>>>>>>> master
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

								p += "<p > First Name: <input type='text' name='fname' value='"
										+ c + "'> </p>";
								p += "<p > Last Name: <input type='text' name='lname' value='"
									+ d + "'> </p>";
								p += "<p > Depart: <input type='text' name='depart' value='"
									+ e + "'> </p>";
								//CLEARING THE PREFILLED DATA 
								$("#divGFG").empty();
								//WRITING THE DATA ON MODEL 
								$("#divGFG").append(p);
							});
		});
	</script>

</body>
</html>
