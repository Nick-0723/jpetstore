<%@ include file="../common/IncludeTop.jsp"%>

<div id="BackLink">
	<a href="shop/index.shtml">Return to Main Menu</a>
</div>

<div id="Catalog">

	<div id="Cart">

		<h2>Shopping Cart</h2>
		<form action="shop/updateCartQuantities.shtml" method="post">
			<table>
				<tr>
					<th><b>Item ID</b></th>
					<th><b>Product ID</b></th>
					<th><b>Description</b></th>
					<th><b>In Stock?</b></th>
					<th><b>Quantity</b></th>
					<th><b>List Price</b></th>
					<th><b>Total Cost</b></th>
					<th>&nbsp;</th>
				</tr>
				<c:if test="${cart.numberOfItems == 0}">
					<tr>
						<td colspan="8"><b>Your cart is empty.</b></td>
					</tr>
				</c:if>
				<c:forEach var="cartItem" items="${cart.cartItems}">
					<tr>
						<td><a href="shop/viewItem.shtml?itemId=${cartItem.item.itemId}">
								${cartItem.item.itemId}
							</a></td>
						<td>${cartItem.item.product.productId}</td>
						<td>${cartItem.item.attribute1}
							${cartItem.item.attribute2}
							${cartItem.item.attribute3}
							${cartItem.item.attribute4} 
							${cartItem.item.attribute5} 
							${cartItem.item.product.name}</td>
						<td>${cartItem.inStock}</td>
						<td><input type="text" size="3"
							name="${cartItem.item.itemId}"
							value="${cartItem.quantity}" /></td>
						<td><fmt:formatNumber type="number" value="${cartItem.item.listPrice}" pattern="$#,##0.00" /></td>
						<td><fmt:formatNumber type="number" value="${cartItem.total}" pattern="$#,##0.00" /></td>
						<td><a class="Button" href="shop/removeItemFromCart.shtml?workingItemId=${cartItem.item.itemId}">
              Remove</a></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="7">Sub Total: <fmt:formatNumber type="number" value="${cart.subTotal}" pattern="$#,##0.00" /> <input type="submit"
						name="update" value="Update Cart" />

					</td>
					<td>&nbsp;</td>
				</tr>
			</table>
			<c:if test="${previousPageAvailable}">
				<a class="Button" href="shop/viewCart.shtml?pageDirection=previous">&lt;&lt;
					Prev</a>
			</c:if>
			<c:if test="${nextPageAvailable}">
				<a class="Button" href="shop/viewCart.shtml?pageDirection=previous">Next
					&gt;&gt;</a>
			</c:if>
		</form>
		<c:if test="${cart.numberOfItems != 0}">
			<a class="Button" href="shop/checkout.shtml">Proceed to Checkout</a>
		</c:if>

	</div>
	<c:if test="${!empty sessionScope.account}">
		<div id="MyList">
			<c:if test="${sessionScope.account.listOption}">
				<%@ include file="IncludeMyList.jsp"%>
			</c:if>
		</div>
  		Welcome ${sessionScope.account.firstName}!
  	</c:if>

	<div id="Separator">&nbsp;</div>

</div>


<%@ include file="../common/IncludeBottom.jsp"%>



