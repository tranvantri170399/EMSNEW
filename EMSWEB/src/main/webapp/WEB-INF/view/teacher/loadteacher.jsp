<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<!DOCTYPE html>
<head>
<meta charset="utf-8" />
<title>Product Manager</title>
</head>
<body>
	<div align="center">
		<h1>List Teacher</h1>
		<a href="/new">Create New Product</a> <br /> <br />
		<table border="1" cellpadding="10">
			<thead>
				<tr>
					<th>Mã GV</th>
					<th>Tên GV</th>
					<th>Chức vụ</th>
					<th>Phòng Ban</th>
					<th>Ảnh</th>
					<th>Mail</th>
					<th>Số điện thoại</th>
					<th>Địa chỉ</th>
					<th>Lương</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${not empty listTCher}">
					<c:forEach var="list" items="${listTCher}">
						<tr>
							<td>${list.id}</td>
							<td>${list.lname}</td>
							<td>${list.role.roleName}</td>
							<td>${list.depart.name }
							<%-- <td><img alt="" src="${list.image}"></td> --%>
							<td>${list.email}</td>
							<td>${list.phone}</td>
							<td>${list.address}</td>
							<td>${list.salary}</td>
						</tr>
					</c:forEach>
				</c:if>
			</tbody>
		</table>
	</div>
	<form action="teacher">
<div class="form-group">
<label for="id">Enter teacher Id :</label> 
<input class="form-control" id="id" type="text" name="id"/>
</div>
<input type="submit" value="Find Teacher By Id" class="btn btn-primary"/>
</form>
</body>
</html>