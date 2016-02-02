<%@ include file="../common/IncludeTop.jsp" %>

<div id="BackLink">

  <a href="shop/viewCategory.shtml?categoryId=${product.categoryId}">
    Return to ${product.categoryId}</a>

</div>

<div id="Catalog">

  <h2>${product.name}</h2>

  <table>
    <tr><th>Item ID</th>  <th>Product ID</th>  <th>Description</th>  <th>List
      Price</th>  <th>&nbsp;</th></tr>
    <c:forEach var="item" items="${itemList}">
      <tr>
        <td>
          <a href="shop/viewItem.shtml?itemId=${item.itemId}">
            ${item.itemId}</a></td>
        <td>${item.product.productId}</td>
        <td>
          ${item.attribute1}
          ${item.attribute2}
          ${item.attribute3}
          ${item.attribute4}
          ${item.attribute5}
          ${product.name}
        </td>
        <td><fmt:formatNumber type="number" value="${item.listPrice}" pattern="$#,##0.00"/></td>
        <td><a class="Button" href="shop/addItemToCart.shtml?workingItemId=${item.itemId}">
          Add to Cart</a></td>
      </tr>
    </c:forEach>
    <tr><td>
    	<c:if test="${!firstPage}">
    		<a class="Button" href="shop/viewProduct.shtml?pageDirection=previous&productId=">&lt;&lt; Prev</a>
    	</c:if>
    	<c:if test="${!lastPage}">
    		<a class="Button" href="shop/viewProduct.shtml?pageDirection=next&productId=">Next &gt;&gt;</a>
    	</c:if>
    </td></tr>
  </table>

</div>

<%@ include file="../common/IncludeBottom.jsp" %>





