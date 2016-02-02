<%@ include file="../common/IncludeTop.jsp" %>

<div id="Catalog">
  <form action="shop/signon.shtml" method="POST">

    <p>Please enter your username and password.</p>
    <p>
      Username:<input type="text" name="username" value="j2ee"/>
      <br/>
      Password:<input type="password" name="password" value="j2ee"/>
    </p>
    <input type="submit" name="submit" value="Login"/>

  </form>

  Need a username and password?
  <a href="shop/newAccountForm.shtml">Register Now!</a>

</div>

<%@ include file="../common/IncludeBottom.jsp" %>

