</div>

<div id="Footer">

	<div id="PoweredBy">
		<a href="http://ibatis.apache.org"><img
			src="images/poweredby.gif" /></a>
	</div>

	<div id="Banner">
		<c:if test="${!empty sessionScope.account && sessionScope.account.bannerOption}">
			${sessionScope.account.bannerName}
		</c:if>
	</div>

</div>

</body>
</html>