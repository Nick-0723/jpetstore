<%@ include file="../common/IncludeTop.jsp"%>

<div id="BackLink">
	<a href="shop/index.shtml">Return to Main Menu</a>
</div>

<div id="Catalog">

	<table>
		<tr>
			<th align="center" colspan="2">Order #${order.orderId} <fmt:formatDate value="${order.orderDate}" pattern="yyyy/MM/dd hh:mm:ss" />
			</th>
		</tr>
		<tr>
			<th colspan="2">Payment Details</th>
		</tr>
		<tr>
			<td>Card Type:</td>
			<td>${order.cardType}</td>
		</tr>
		<tr>
			<td>Card Number:</td>
			<td>${order.creditCard} * Fake
				number!</td>
		</tr>
		<tr>
			<td>Expiry Date (MM/YYYY):</td>
			<td>${order.expiryDate}</td>
		</tr>
		<tr>
			<th colspan="2">Billing Address</th>
		</tr>
		<tr>
			<td>First name:</td>
			<td>${order.billToFirstName}</td>
		</tr>
		<tr>
			<td>Last name:</td>
			<td>${order.billToLastName}</td>
		</tr>
		<tr>
			<td>Address 1:</td>
			<td>${order.billAddress1}</td>
		</tr>
		<tr>
			<td>Address 2:</td>
			<td>${order.billAddress2}</td>
		</tr>
		<tr>
			<td>City:</td>
			<td>${order.billCity}</td>
		</tr>
		<tr>
			<td>State:</td>
			<td>${order.billState}</td>
		</tr>
		<tr>
			<td>Zip:</td>
			<td>${order.billZip}</td>
		</tr>
		<tr>
			<td>Country:</td>
			<td>${order.billCountry}</td>
		</tr>
		<tr>
			<th colspan="2">Shipping Address</th>
		</tr>
		<tr>
			<td>First name:</td>
			<td>${order.shipToFirstName}</td>
		</tr>
		<tr>
			<td>Last name:</td>
			<td>${order.shipToLastName}</td>
		</tr>
		<tr>
			<td>Address 1:</td>
			<td>${order.shipAddress1}</td>
		</tr>
		<tr>
			<td>Address 2:</td>
			<td>${order.shipAddress2}</td>
		</tr>
		<tr>
			<td>City:</td>
			<td>${order.shipCity}</td>
		</tr>
		<tr>
			<td>State:</td>
			<td>${order.shipState}</td>
		</tr>
		<tr>
			<td>Zip:</td>
			<td>${order.shipZip}</td>
		</tr>
		<tr>
			<td>Country:</td>
			<td>${order.shipCountry}</td>
		</tr>
		<tr>
			<td>Courier:</td>
			<td>${order.courier}</td>
		</tr>
		<tr>
			<td colspan="2">Status: ${order.status}
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<table>
					<tr>
						<th>Item ID</th>
						<th>Description</th>
						<th>Quantity</th>
						<th>Price</th>
						<th>Total Cost</th>
					</tr>
					<c:forEach var="item" items="order.lineItems">
						<tr>
							<td><a href="shop/viewItem.shtml?itemId=${item.itemId}">
									${item.itemId}
								</a></td>
							<td>
								<c:choose>
									<c:when test="${not empty item.item}">
										${item.item.attribute1}
										${item.item.attribute2}
										${item.item.attribute3}
										${item.item.attribute4}
										${item.item.attribute5}
										${item.item.product.name}
									</c:when>
									<c:otherwise>
										<i>{description unavailable}</i>
									</c:otherwise>
								</c:choose>
							</td>

							<td>${item.quantity}</td>
							<td><fmt:formatNumber type="number" value="${item.unitPrice}" pattern="$#,##0.00" /></td>
							<td><fmt:formatNumber type="number" value="${item.total}" pattern="$#,##0.00" /></td>
						</tr>
					</c:forEach>
					<tr>
						<th colspan="5">Total: <fmt:formatNumber type="number" value="${order.totalPrice}" pattern="$#,##0.00" />
						</th>
					</tr>
				</table>
			</td>
		</tr>

	</table>

</div>

<%@ include file="../common/IncludeBottom.jsp"%>



