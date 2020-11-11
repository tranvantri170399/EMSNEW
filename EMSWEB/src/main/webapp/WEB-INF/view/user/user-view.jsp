<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
</head>
<body>
  <a href="/user-list">List User</a> 
  <br/> <br/>
  
<form:form  modelAttribute="user">     
<div class="form-group">
  <label class="col-form-label" for="password">pass :</label>
    <form:input path="password" value="${user.password}" class="form-control"/>
</div>
</form:form>
</body>
</html>