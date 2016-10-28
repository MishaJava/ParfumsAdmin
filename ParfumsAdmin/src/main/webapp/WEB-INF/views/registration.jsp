<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href='<c:url value ='/resources/css/registration.css'/>' rel="stylesheet"/>
<link href='<c:url value ='/resources/css/body.css'/>' rel="stylesheet"/>  
 </head>
<body>
<sec:authorize access = "isAuthenticated() and hasRole('ROLE_ADMIN')">
<div class = "container">
 <div class = "jumbotron" style = "opacity:0.6">
    <h1 align = "center"> Add Parfum</h1>
 </div>
</div>
<div class = "container" style = "width:500px">
<form:form  class="form-horizontal"   action = "register" method = "post" enctype="multipart/form-data" onsubmit = "return validate()" >
<div class = "form-group">
<label class="control-label col-sm-2" for = "category">Type:</label>
 <div class = "col-md-8">
  <div class="input-group">
 <select id = "category" class="selectpicker show-tick" data-style = "btn btn-primary" name = "category">
  <option>France</option>
  <option>Holland</option>
</select>
</div>
</div>
</div>
<div class = "form-group">
<label class="control-label col-sm-2" for = "name">Name:</label>
 <div class = "col-md-8">
   <div class="input-group">
 <input onkeyup = "n()" id = "name" type="text" class="form-control" name = "name" placeholder="Input name"/>
 <span class="input-group-addon"><i id = "nm"></i></span>
 </div>
  </div>
</div>
<div class = "form-group">
<label class="control-label col-sm-2" for = "subname">Subname:</label>
 <div class = "col-md-8">
  <div class="input-group">
<input id = "subname" onkeyup = "k()" type="text" class="form-control" name = "subname" placeholder="Input subname"/>
 <span class="input-group-addon"><i id = "sm"></i></span>
</div>
</div>
</div>
<div class = "form-group">
<label class="control-label col-sm-2" for = "opus">Opus:</label>
 <div class = "col-md-8">
 <div class = "input-group">
<textarea  id = "opus" onkeyup = "o()" class="form-control" rows="5" name = "opus"></textarea>
 <span class="input-group-addon"><i id = "om"></i></span>
</div>
</div>
</div>
<div class = "form-group">
<label class="control-label col-sm-2" for="ml">Ml:</label>
 <div class = "col-md-8">
 <div class = "input-group">
 <input onkeyup = "m()" id = "ml" type="text" class="form-control" name = "ml" placeholder="Input ml"/>
  <span class="input-group-addon"><i id = "lm"></i></span>
 </div>
 </div>
</div>
<div class = "form-group" >
<label class="control-label col-sm-2" for = "price">Price:</label>
 <div class = "col-md-8">
 <div class = "input-group">
 <input  onkeyup = "p()" id = "price" type="text"  class="form-control" name = "price" placeholder="Input price"/>
  <span class="input-group-addon"><i id = "lp"></i></span>
  </div>
 </div>
</div>
<div class = "form-group">
 <label class="control-label col-sm-2"  for = "file">Photo:</label> 
    <div class = "col-md-8">
         <div class = "input-group">
                <label class="input-group-btn">
                    <span class="btn  btn-primary">
                        Browse<input id = "file" onchange = "f()" class = "form-control" type="file"   name = "photo" style="display: none;"/>
                    </span>
                </label>
                <input type="text" class="form-control" readonly/>
                <span class="input-group-addon"><i id = "fm"></i></span>
         </div>
     </div>
</div>
<div class="text-right col-md-10">
<button type="submit" class="btn  btn-primary">Add</button> 
</div> 
</form:form>
</div>
<script type="text/javascript">
function p(){
	var a =  document.getElementById("price").value;
	if(isNaN(a)==true || a.length==0 || a.length>5){
		document.getElementById("lp").className = "fa fa-times";
		document.getElementById("lp").style.color="red";
		document.getElementById("price").style.borderColor="red";
		return false;
	}
	else{
		document.getElementById("lp").className = "fa fa-check";
		document.getElementById("lp").style.color="green";
		document.getElementById("price").style.borderColor="green";
	}
}
function m(){
	var a =  document.getElementById("ml").value;
	if(isNaN(a)==true || a.length==0 || a.length>5){
		document.getElementById("lm").className = "fa fa-times";
		document.getElementById("lm").style.color="red";
		document.getElementById("ml").style.borderColor="red";
		return false;
	}
	else{
		document.getElementById("lm").className = "fa fa-check";
		document.getElementById("lm").style.color="green";
		document.getElementById("ml").style.borderColor="green";
	}
}
function n(){
	var a =  document.getElementById("name").value;
	if(a.length== 0 || a.length<3 || a.length>20){
		document.getElementById("nm").className = "fa fa-times";
		document.getElementById("nm").style.color="red";
		document.getElementById("name").style.borderColor="red";
		return false;
	}
	else{
		document.getElementById("nm").className = "fa fa-check";
		document.getElementById("nm").style.color="green";
		document.getElementById("name").style.borderColor="green";
	}
}
function k(){
	var a =  document.getElementById("subname").value;
	if(a.length== 0 || a.length<3||a.length>20){
		document.getElementById("sm").className = "fa fa-times";
		document.getElementById("sm").style.color="red";
		document.getElementById("subname").style.borderColor="red";
		return false;
	}
	else{
		document.getElementById("sm").className = "fa fa-check";
		document.getElementById("sm").style.color="green";
		document.getElementById("subname").style.borderColor="green";
	}
}
function o(){
	var a =  document.getElementById("opus").value;
	if(a.length== 0 || a.length<3||a.length>20){
		document.getElementById("om").className = "fa fa-times";
		document.getElementById("om").style.color="red";
		document.getElementById("opus").style.borderColor="red";
		return false;
	}
	else{
		document.getElementById("om").className = "fa fa-check";
		document.getElementById("om").style.color="green";
		document.getElementById("opus").style.borderColor="green";
	}
}
function f(){
	var a =  document.getElementById("file");
	if(a.files.length==0){
		document.getElementById("fm").className = "fa fa-times";
		document.getElementById("fm").style.color="red";
		return false;
	} 
	else{
		document.getElementById("fm").className = "fa fa-check";
		document.getElementById("fm").style.color="green";
	}
}
function validate(){
if(p()==false | m()==false | o()==false | n()==false | k()==false | f()==false){
	return false;
}
}
$(function() {

	  $(document).on('change', ':file', function() {
	    var input = $(this),
	        numFiles = input.get(0).files ? input.get(0).files.length : 1,
	        label = input.val().replace(/\\/g, '/').replace(/.*\//, '');
	    input.trigger('fileselect', [numFiles, label]);
	  });

	  $(document).ready( function() {
	      $(':file').on('fileselect', function(event, numFiles, label) {

	          var input = $(this).parents('.input-group').find(':text'),
	              log = numFiles > 1 ? numFiles + ' files selected' : label;

	          if( input.length ) {
	              input.val(log);
	          } else {
	              if( log ) alert(log);
	          }

	      });
	  });
	  
	});
</script>
</sec:authorize>
</body>
</html>
