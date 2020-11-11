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
  <a href="/user-list">List User</a><br />
  <h1>Edit User:</h1>
  <form:form action="/updateUser" method="POST" modelAttribute="user">
      username:  <form:input path="username" value="${user.username} readonly="true" /> <br/> <br/>
      password: <form:input path="password" value="${user.password}"/> <br/> <br/>
      Address: <form:input path="role" value="${user.role}"/> <br/> <br/>
    <input type="submit" value="Submit" />
  </form:form>
</body>

</html>