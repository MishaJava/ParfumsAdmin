<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <link href='<c:url value ='/resources/css/body.css'/>' rel="stylesheet"/>
 <link rel='stylesheet' href='https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.css'>
<script src='https://cdn.rawgit.com/t4t5/sweetalert/v0.2.0/lib/sweet-alert.min.js'></script>  
</head>
<body>
<sec:authorize access = "isAuthenticated() and hasRole('ROLE_ADMIN')">
 <c:url var = "search" value = "/search"/>
<div class = "container">
 <div class = "well" style = "opacity:0.6">
    <h1 align = "center">Search <i class = "fa fa-search" style = "color:#FE2E2E" ></i></h1>
 </div>
</div>
<div class = "container">
 <button id = "btntgl" type = "submit" class = "btn btn-info">Toggle</button>
</div>
<div class = "container">
 <form:form action = "search" method = "POST" class = "form-inline" id = "myform">
 <div class = "form-group">
 <input id = "category" type="text" class="form-control" name = "category" placeholder="Input category" value = "${category}"/>
 <input type="text" class="form-control" name = "name" placeholder="Input name" value = "${name}" />
 <input type="text" class="form-control" name = "subname" placeholder="Input subname" id = "subname" value = "${subname}"/>
 <input type="text" class="form-control" name = "ml" placeholder="Input ml" id = "ml" value = "${ml}"/>
 <div class = "input-group">
 <input type="text" class="form-control" name = "price" placeholder="Input price" id = "price" value = "${price}"/>
  <span class = "input-group-btn">
 <button type="submit" class="btn btn-success">Search <i class = "fa fa-search fa-1x"></i></button> 
 </span>
 </div>
 </div>
</form:form>
</div>
 <div class ="container" style = "margin-top:50px">
    <table class ="table">
           <tr>
              <th>Id</th>
              <th>Photo</th>
              <th>France/Holland</th>
              <th>Parfum</th>
              <th>Collection</th>
              <th>Value</th>
              <th>Price </th>
              <th>Edit</th>
              <th>Delete</th>
              
           </tr>
     <c:forEach items = "${parfums}" var = "p">
            <tr>
            <td>${p.id}</td>
            <td><img class="img-rounded" src="data:image/png;base64,${p.base64String}" style = "heigth:100px;width:100px"></td>
            <td>${p.category}</td>
            <td>${p.name}</td>
            <td>${p.subname}</td>
            <td>${p.ml}</td>
            <td>${p.price}</td>
            <td><a  class="btn btn-primary" href = "update/${p.id}">Edit</a></td>
            <c:url var = "delet" value = "delete/${p.id}"/>
            <td><a  id = "d" class="btn btn-danger"  onclick = "del()"><i class="fa fa-trash-o"></i>Delete</a>
          </tr>
          </c:forEach>
     </table>
 </div>
<script type="text/javascript">
function del(){
	swal({
		  title: "Do you want to delete?",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonClass: "btn-danger",
		  confirmButtonText: "Delete",
		  cancelButtonText: "Cancel",
		  closeOnConfirm: false,
		  closeOnCancel: false
		},
		function(isConfirm){   
			if(isConfirm){
            swal({
                title: "Deleted!",
                text: "Parfum has been deleted",
                type: "success",
            }, 
            function(){
              document.location.href = "${delet}";
          	  document.forms["myform"].submit();
            })
			}
			else{
			swal("Canceled","Parfum has not been deleted","error");
			}
		});
}
$(document).ready(function(){
	$('#btntgl').click(function(){
		$('#myform').toggle(1000);
		}); 
	});
</script>
</sec:authorize>
</body>
</html>