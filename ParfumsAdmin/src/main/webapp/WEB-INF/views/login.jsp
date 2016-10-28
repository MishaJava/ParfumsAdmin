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
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/css/bootstrap-select.min.css">
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.7.5/js/bootstrap-select.min.js"></script>
 <link href='<c:url value ='/resources/css/body.css'/>' rel="stylesheet"/>  
</head>
<body>
<div class = "container" style = "opacity:0.6;">
  <div class = "well">
    <h1 align = "left">Login Form</h1>
  </div>
</div>
<div class="container" style = "width:300px;margin-top:80px;">

<c:url var="loginUrl" value="/login" />
<form action="${loginUrl}" method='POST'>  
<div class="form-group">  
    <label for="username" style = "color:DimGray;">Username</label>  
    <input type="text" class="form-control" id="username" name = "username" placeholder="Input username">  
  </div>  
  <div class="form-group">  
    <label for="passwordLabel">Password</label>  
    <input type="password" class="form-control" id="passwordLabel" name = "password" placeholder="Input password">  
  </div>
  <button type="submit" class="btn btn-success">Login</button>  
 </form>  
 </div>
</body>
</html>