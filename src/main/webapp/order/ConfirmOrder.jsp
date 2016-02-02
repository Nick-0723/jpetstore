<%@ include file="../common/IncludeTop.jsp" %>


<div id="BackLink">
  <a href="shop/index.shtml">Return to Main Menu</a>
</div>

<div id="Catalog">

  Please confirm the information below and then press continue...

  <table>
    <tr><th align="center" colspan="2">
      <font size="4"><b>Order</b></font>
      <br/><font size="3"><b><fmt:formatDate value="${order.orderDate}" pattern="yyyy/MM/dd hh:mm:ss"/></b></font>
    </th></tr>

    <tr><th colspan="2">
      Billing Address
    </th></tr>
    <tr><td>
      First name:</td><td>${order.billToFirstName}
    </td></tr>
    <tr><td>
      Last name:</td><td>${order.billToLastName}
    </td></tr>
    <tr><td>
      Address 1:</td><td>${order.billAddress1}
    </td></tr>
    <tr><td>
      Address 2:</td><td>${order.billAddress2}
    </td></tr>
    <tr><td>
      City: </td><td>${order.billCity}
    </td></tr>
    <tr><td>
      State:</td><td>${order.billState}
    </td></tr>
    <tr><td>
      Zip:</td><td>${order.billZip}
    </td></tr>
    <tr><td>
      Country: </td><td>${order.billCountry}
    </td></tr>
    <tr><th colspan="2">
      Shipping Address
    </th></tr><tr><td>
    First name:</td><td>${order.shipToFirstName}
  </td></tr>
    <tr><td>
      Last name:</td><td>${order.shipToLastName}
    </td></tr>
    <tr><td>
      Address 1:</td><td>${order.shipAddress1}
    </td></tr>
    <tr><td>
      Address 2:</td><td>${order.shipAddress2}
    </td></tr>
    <tr><td>
      City: </td><td>${order.shipCity}
    </td></tr>
    <tr><td>
      State:</td><td>${order.shipState}
    </td></tr>
    <tr><td>
      Zip:</td><td>${order.shipZip}
    </td></tr>
    <tr><td>
      Country: </td><td>${order.shipCountry}
    </td></tr>

  </table>


  <a class="Button" href="shop/newOrder.shtml">Confirm</a>

</div>

<%@ include file="../common/IncludeBottom.jsp" %>





