<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<!DOCTYPE html>
<html>
	<head>
  	</head>
  	<body>
  		<div class="wrapper">
  			<tiles:insertAttribute name="header"/>
	  			<div class="content">
			  		<tiles:insertAttribute name="content"/>
			  	</div>	
			  	<tiles:insertAttribute name="footer"/>
		</div>
  	</body>
