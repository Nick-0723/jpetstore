<%@ include file="../common/IncludeTop.jsp" %>

<div id="BackLink">
  <a href="shop/viewCart.shtml">Return to Shopping Cart</a>
</div>

<div id="Catalog">

  <table>
    <tr>
      <td>
        <h2>Checkout Summary</h2>

        <table>

          <tr>
            <td><b>Item ID</b></td>  <td><b>Product ID</b></td>  <td><b>Description</b></td> <td><b>In Stock?</b></td>
            <td><b>Quantity</b></td>  <td><b>List Price</b></td> <td><b>Total Cost</b></td>
          </tr>
		<c:forEach var="cartItem" items="${cart.cartItems}">
            <tr>
              <td>
                <a href="shop/viewItem.shtml?itemId=${cartItem.item.itemId}">
                  ${cartItem.item.itemId}</a></td>
              <td>${cartItem.item.productId}</td>
              <td>
                ${cartItem.item.attribute1}
                ${cartItem.item.attribute2}
                ${cartItem.item.attribute3}
                ${cartItem.item.attribute4}
                ${cartItem.item.attribute5}
                ${cartItem.item.product.name}
              </td>
              <td>${cartItem.inStock}</td>
              <td>
                ${cartItem.quantity}
              </td>
              <td><fmt:formatNumber type="number" value="${cartItem.item.listPrice}" pattern="$#,##0.00"/></td>
              <td><fmt:formatNumber type="number" value="${cartItem.total}" pattern="$#,##0.00"/></td>
            </tr>
         </c:forEach>
          <tr>
            <td colspan="7">
              Sub Total: <fmt:formatNumber type="number" value="${cart.subTotal}" pattern="$#,##0.00"/>
            </td>
          </tr>
        </table>
        <c:if test="${!firstPage}">
        	<a href="switchCartPage.shtml?pageDirection=previous">&lt;&lt; Previous</a>
        </c:if>
        <c:if test="${!lastPage}">
        	<a href="switchCartPage.shtml?pageDirection=next">Next &gt;&gt;</a>
        </c:if>
        <a class="Button" href="shop/newOrderForm.shtml">Continue</a>
      </td>
      <td>
        &nbsp;
      </td>

    </tr>
  </table>

</div>

<%@ include file="../common/IncludeBottom.jsp" %>





