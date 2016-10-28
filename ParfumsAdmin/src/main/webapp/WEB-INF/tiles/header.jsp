<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/js/bootstrap-select.min.js"></script>

</head>
<body>
<c:url value = '/logout' var = "logout"/>
<c:url value = '/register' var = "register"/>
<c:url value = '/admin' var = "admin"/>
<c:url value = '/getAll' var = "getAll"/>
<c:url value = '/search' var = "s"/>
<div class = "container">
<div class="tabbable tabs-left">
  <ul class="nav nav-tabs">
     <li><a class="nav-link active" href="${admin}">Home</a></li>
 <li><a class="nav-link" href="${register}"  >Add</a></li>
 <li><a class="nav-link" href="${getAll}" >All list</a></li>
 <li> <a class="nav-link" href="${s}" >Search</a> </li>
  <li>  <a class="nav-link" href="${logout}">Logout</a></li>
  </ul>
  </div>
  </div>

</body>
</html>