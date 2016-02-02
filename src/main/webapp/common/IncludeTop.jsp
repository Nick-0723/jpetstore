<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">



<head>
<meta name="generator"
	content="HTML Tidy for Linux/x86 (vers 1st November 2002), see www.w3.org" />
<title>JPetStore Demo</title>
<base href="<%=basePath%>">
<meta content="text/html; charset=windows-1252"
	http-equiv="Content-Type" />
<meta http-equiv="Cache-Control" content="max-age=0" />
<meta http-equiv="Cache-Control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="Expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
<meta http-equiv="Pragma" content="no-cache" />
<link rel="StyleSheet" href="css/jpetstore.css" type="text/css"
	media="screen" />
</head>

<body>

	<div id="Header">

		<div id="Logo">
			<div id="LogoContent">
				<a href="shop/index.shtml">
					<img src="images/logo-topbar.gif" />
				</a>
			</div>
		</div>

		<div id="Menu">
			<div id="MenuContent">
				<a href="shop/viewCart.shtml">
					<img align="middle" name="img_cart" src="images/cart.gif" />
				</a>
				<img align="middle" src="images/separator.gif" />
				<c:choose>
					<c:when test="${!empty sessionScope.account}">
						<a href="shop/signoff.shtml">Sign Out</a>
						<img align="middle" src="images/separator.gif" />
						<a href="shop/editAccountForm.shtml">My Account</a>
					</c:when>
					<c:otherwise>
						<a href="shop/signonForm.shtml">Sign In</a>
					</c:otherwise>
				</c:choose>

				<img align="middle" src="images/separator.gif" />
				<a href="help.html">?</a>
			</div>
		</div>

		<div id="Search">
			<div id="SearchContent">
				<form method="post" action="shop/searchProducts.shtml">
					<input name="keyword" size="14" />&nbsp;<input type="submit"
						name="SearchButton" value="Search" />
				</form>
			</div>
		</div>

		<div id="QuickLinks">
			<a href="shop/viewCategory.shtml?categoryId=FISH">
				<img src="images/sm_fish.gif" />
			</a>
			<img src="images/separator.gif" />
			<a href="shop/viewCategory.shtml?categoryId=DOGS">
				<img src="images/sm_dogs.gif" />
			</a>
			<img src="images/separator.gif" />
			<a href="shop/viewCategory.shtml?categoryId=REPTILES">
				<img src="images/sm_reptiles.gif" />
			</a>
			<img src="images/separator.gif" />
			<a href="shop/viewCategory.shtml?categoryId=CATS">
				<img src="images/sm_cats.gif" />
			</a>
			<img src="images/separator.gif" />
			<a href="shop/viewCategory.shtml?categoryId=BIRDS">
				<img src="images/sm_birds.gif" />
			</a>
		</div>

	</div>

	<div id="Content">

		<!-- Support for non-traditional but simple message -->
		<c:if test="${not empty message}">
			${message}
		</c:if>

		<!-- Support for non-traditional but simpler use of errors... -->
		<c:if test="${not empty errors}">
			<c:forEach var="error" items="errors">
				${error}
			</c:forEach>
		</c:if>