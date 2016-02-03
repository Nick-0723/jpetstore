<%@ include file="../common/IncludeTop.jsp" %>

<div id="Catalog">

  <form action="shop/newAccount.shtml" method="post">

    <input type="hidden" name="validation" value="new"/>

    <h3>User Information</h3>

    <table>
      <tr>
        <td>User ID:</td><td><input type="text" name="username"/></td>
      </tr><tr>
      <td>New password:</td><td><input type="password" name="password"/></td>
    </tr><tr>
      <td>Repeat password:</td><td><input type="password" name="repeatedPassword"/></td>
    </tr>
    </table>

    <%@ include file="IncludeAccountFields.jsp" %>

    <input type="submit" name="submit" value="Create Account"/>

  </form>

</div>

<%@ include file="../common/IncludeBottom.jsp" %>