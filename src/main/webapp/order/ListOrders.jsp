<%@ include file="../common/IncludeTop.jsp" %>

<h2>My Orders</h2>

<table>
  <tr><th>Order ID</th>  <th>Date</th>  <th>Total Price</th></tr>
<c:forEach var="order" items="${orderBean.orderList}">
    <tr>
      <td><a href="shop/viewOrder.shtml?orderId=${order.orderId}">
        ${order.orderId}</a></td>
      <td><fmt:formatDate value="${order.orderDate}" pattern="yyyy/MM/dd hh:mm:ss"/></td>
      <td><fmt:formatNumber type="number" value="${order.totalPrice}" pattern="$#,##0.00"/></td>
    </tr>
  </c:forEach>
</table>

<c:if test="${!firstPage}">
	<a href="switchOrderPage.shtml?pageDirection=previous">&lt;&lt; Previous</a>
</c:if>
<c:if test="${!lastPage}">
	<a href="switchOrderPage.shtml?pageDirection=next">Next &gt;&gt;</a>
</c:if>

<%@ include file="../common/IncludeBottom.jsp" %>


