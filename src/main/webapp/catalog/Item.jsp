<%@ include file="../common/IncludeTop.jsp" %>

<div id="BackLink">

  <a href="shop/viewProduct.shtml?productId=${product.productId}">
    Return to ${product.name}</a>

</div>

<div id="Catalog">

  <table>
    <tr>
      <td>
      	${product.description}
      </td>
    </tr>
    <tr>
      <td>
        <b>${item.itemId}</b>
      </td>
    </tr><tr>
    <td>
      <b><font size="4">
        ${item.attribute1}
        ${item.attribute2}
        ${item.attribute3}
        ${item.attribute4}
        ${item.attribute5}
        ${item.product.name}
      </font></b>
    </td></tr>
    <tr><td>
      ${product.name}
    </td></tr>
    <tr><td>
    	<c:choose>
    		<c:when test="${item.quantity >= 1}">${item.quantity}</c:when><c:otherwise>Back ordered.</c:otherwise>
    	</c:choose>
    </td></tr>
    <tr><td>
      <fmt:formatNumber type="number" value="${item.listPrice}" pattern="$#,##0.00"/>
    </td></tr>

    <tr><td>
      <a class="Button" href="shop/addItemToCart.shtml?workingItemId=${item.itemId}">
        Add to Cart</a>
    </td></tr>
  </table>

</div>

<%@ include file="../common/IncludeBottom.jsp" %>



