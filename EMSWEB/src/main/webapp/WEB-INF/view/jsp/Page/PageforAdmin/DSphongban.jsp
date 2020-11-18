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
 <link href="../../../../../resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />	
     <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="http://code.ionicframework.com/ionicons/2.0.0/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="../../../../../resources/bootstrap/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="../../../../../resources/bootstrap/css/_all-skins.min.css" rel="stylesheet" type="text/css" />

<script>
	$(document).ready(function() {
		$('#table1').DataTable();
	});
</script>

<style type="text/css">
</style>
</head>
<body>
	    <section class="content-header">
        <h1>
            Danh sách phòng ban
            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#myModal">Thêm phòng ban</button>
        </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i>Trang chủ</a></li>
            <li class="active">Quản lí nhân viên</li>
            <li class="active">Danh sách phòng ban</li>
          </ol>
        </section>	
        <section class="content">	
	<!---Modal-->
	<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Thêm Phòng Ban</h4>
        </div>
        <div class="modal-body">
          	<div>
				<form:form action="/save" modelAttribute="depart">
					<div clas="form-group">
						<label for="InputID">ID:</label>
						<form:input path="id" class="form-control" />
					</div>
					<div class="form-group">
						<label for="InputName">Name:tritran</label>
						<form:input path="name" class="form-control" />
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
	<!--endModel-->
	<table id="table1" class="display">

		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Desc</th>
				<th>Action</th>
			</tr>
		</thead>

		<tbody>
			<c:if test="${not empty List}">
				<c:forEach var="sp" items="${List}">
					<tr>
						<td>${sp.id}</td>
						<td>${sp.name}</td>
						<td></td>
						<td style="text-align: center;"><input type="button"
							value="update"><input type="button" value="del"></td>
					</tr>
				</c:forEach>
			</c:if>

		</tbody>


	</table>
</section>
	<script src="../../../../../resources/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>	
</body>
</html>
