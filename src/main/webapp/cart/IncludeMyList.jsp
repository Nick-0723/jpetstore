<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="myList" value="${sessionScope.myList}"/>

<c:if test="${not empty myList}">
  <p>
    Pet Favorites
    <br/>
    Shop for more of your favorite pets here.
  </p>
  <ul>
  	<c:forEach var="product" items="${myList}">
      <li><a href="shop/viewProduct.shtml?productId=${product.productId}">
        ${product.name}</a>
      (${product.productId})</li>
    </c:forEach>
  </ul>

  <p>
  	<c:if test="${!firstPage}">
  	      <a href="switchMyListPage.shtml?pageDirection=previous&account.listOption=${sessionScope.account.listOption}&account.bannerOption=${accountBean.account.bannerOption}">&lt;&lt;Prev</a>
  	</c:if>
  	<c:if test="${!lastPage}">
		  <a href="switchMyListPage.shtml?pageDirection=next&account.listOption=${sessionScope.account.listOption}&account.bannerOption=${accountBean.account.bannerOption}">Next &gt;&gt;</a>
  	</c:if>
  </p>

</c:if>




