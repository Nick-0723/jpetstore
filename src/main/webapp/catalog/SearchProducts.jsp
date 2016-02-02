<%@ include file="../common/IncludeTop.jsp"%>

<div id="BackLink">

	<a href="shop/index.shtml">Return to Main Menu</a>

</div>

<div id="Catalog">

	<table>
		<tr>
			<th>&nbsp;</th>
			<th>Product ID</th>
			<th>Name</th>
		</tr>
		<c:forEach var="product" items="${productList}">
			<tr>
				<td><a href="shop/viewProduct.shtml?productId=${product.productId}">
						${product.description}
					</a></td>
				<td><b><a href="shop/viewProduct.shtml?productId=${product.productId}">
							<font color="BLACK">${product.productId}</font>
						</a></b></td>
				<td>${product.name}</td>
			</tr>
		</c:forEach>
		<tr>
			<td><c:if test="${!firstPage}">
					<a href="shop/searchProducts.shtml?pageDirection=previous&keyword=">&lt;&lt;
						Previous</a>			
				</c:if>
				<c:if test="${!lastPage}">
					<a href="shop/searchProducts.shtml?pageDirection=next&keyword=">Next
						&gt;&gt;</a>			
				</c:if>
			</td>
		</tr>

	</table>

</div>

<%@ include file="../common/IncludeBottom.jsp"%>




