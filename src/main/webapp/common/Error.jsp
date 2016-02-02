<%@ page import="java.io.PrintWriter" isErrorPage="true"%>
<%@ include file="../common/IncludeTop.jsp"%>

<c:if test="${empty exception && empty message}">
		<h3>Something happened...</h3>
		<b>But no further information was provided.</b>	
</c:if>
<p></p>
<c:if test="${not empty message}">
	<h3>Error!</h3>
	<p>${message}</p>
</c:if>
<p></p>
<c:if test="${not empty exception}">
	<h4>Stack</h4>
	<pre>
    <%
    	Exception e = (Exception) request.getAttribute("exception");
    		e.printStackTrace(new PrintWriter(out));
    %>
  </pre>
</c:if>

<%@ include file="../common/IncludeBottom.jsp"%>