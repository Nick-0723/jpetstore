<%@ include file="../common/IncludeTop.jsp"%>

<div id="BackLink">

	<a href="shop/index.shtml">Return to Main Menu</a>

</div>

<div id="Catalog">

	<h2>
		${category.name}
	</h2>

	<table>
		<tr>
			<th>Product ID</th>
			<th>Name</th>
		</tr>
		<c:forEach var="product" items="${productList}">
			<tr>
				<td><a href="shop/viewProduct.shtml?productId=${product.productId}">
						${product.productId}
					</a></td>
				<td>${product.name}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="2">
				<c:if test="${!firstPage}">
					<a class="Button" href="shop/viewCategory.shtml?pageDirection=previous&categoryId=">&lt;&lt;
						Prev</a>				
				</c:if>
				<c:if test="${!lastPage}">
					<a class="Button" href="shop/viewCategory.shtml?pageDirection=next&categoryId=">Next
						&gt;&gt;</a>				
				</c:if>
			</td>
		</tr>
	</table>

</div>

<%@ include file="../common/IncludeBottom.jsp"%>


