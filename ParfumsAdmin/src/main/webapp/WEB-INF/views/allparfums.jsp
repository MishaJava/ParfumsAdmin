<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="org.apache.commons.codec.binary.Base64"%>
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
<div class = "container">
 <div class = "well" style = "opacity:0.6">
   <h1 align = "center">Parfums <i class="fa fa-database" aria-hidden="true" style = "color:#FFD700;"></i></h1>
 </div>
 <div class ="container">
    <table class ="table">
           <tr>
              <th>Id</th>
              <th>Photo</th>
              <th>France/Holland</th>
              <th>Parfum</th>
              <th>Collection</th>
              <th>Value</th>
              <th>Price <i class="fa fa-usd"></i></th>
              <th>Edit <i class="fa fa-pencil"></i></th>
              <th>Delete   <i class="fa fa-trash-o"></i></th>
           </tr>
     <c:forEach items = "${parfum}" var = "p">
            <tr>
            <td>${p.id}</td>
            <td><img class="img-rounded" src="data:image/png;base64,${p.base64String}" style = "heigth:100px;width:100px"></td>
            <td>${p.category}</td>
            <td>${p.name}</td>
            <td>${p.subname}</td>
            <td>${p.ml}</td>
            <td>${p.price}</td>
            <td><a class="btn btn-primary" href = "update/${p.id}">Edit</a></td>
            <c:url var = "d" value = "delete/${p.id}"/>
            <td><a class="btn btn-danger" onclick = "del()">Delete <i class="fa fa-trash-o"></i></a>
          </tr>
          </c:forEach>
     </table>
 </div>
</div>
</sec:authorize>
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
              document.location.href = "${d}";
            })
			}
			else{
			swal("Canceled","Parfum has not been deleted","error");
			}
		});
}
</script>
</body>
</html>