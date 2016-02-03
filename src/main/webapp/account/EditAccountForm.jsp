<%@ include file="../common/IncludeTop.jsp" %>

<div id="Catalog">

  <form method="post" action="shop/editAccount.shtml">

    <input type="hidden" name="validation" value="edit"/>
    <input type="hidden" name="username"/>

    <h3>User Information</h3>

    <table>
      <tr>
        <td>User ID:</td><td>${account.username}</td>
      </tr><tr>
      <td>New password:</td><td><input type="password" name="password"/></td>
    </tr><tr>
      <td>Repeat password:</td><td><input type="password" name="repeatedPassword"/></td>
    </tr>
    </table>
    <%@ include file="IncludeAccountFields.jsp" %>

    <input type="submit" name="submit" value="Save Account Information"/>

  </form>

  <a href="shop/listOrders.shtml">My Orders</a>

</div>

<%@ include file="../common/IncludeBottom.jsp" %>


