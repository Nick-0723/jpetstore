<%@include file="/common/IncludeTop.jsp"%>

<div id="Welcome">
	<div id="WelcomeContent">
		<c:if test="${!empty sessionScope.account}" >
  			Welcome ${sessionScope.account.firstName}!
  		</c:if>
	</div>
</div>

<div id="Main">
	<div id="Sidebar">
		<div id="SidebarContent">
			<a href="shop/viewCategory.shtml?categoryId=FISH">
				<img src="images/fish_icon.gif" />
			</a>
			<br /> Saltwater, Freshwater <br />
			<a href="shop/viewCategory.shtml?categoryId=DOGS">
				<img src="images/dogs_icon.gif" />
			</a>
			<br /> Various Breeds <br />
			<a href="shop/viewCategory.shtml?categoryId=CATS">
				<img src="images/cats_icon.gif" />
			</a>
			<br /> Various Breeds, Exotic Varieties <br />
			<a href="shop/viewCategory.shtml?categoryId=REPTILES">
				<img src="images/reptiles_icon.gif" />
			</a>
			<br /> Lizards, Turtles, Snakes <br />
			<a href="shop/viewCategory.shtml?categoryId=BIRDS">
				<img src="images/birds_icon.gif" />
			</a>
			<br />Exotic Varieties
		</div>
	</div>

	<div id="MainImage">
		<div id="MainImageContent">
			<map name="estoremap">
				<area alt="Birds" coords="72,2,280,250"
					href="shop/viewCategory.shtml?categoryId=BIRDS" shape="RECT" />
				<area alt="Fish" coords="2,180,72,250"
					href="shop/viewCategory.shtml?categoryId=FISH" shape="RECT" />
				<area alt="Dogs" coords="60,250,130,320"
					href="shop/viewCategory.shtml?categoryId=DOGS" shape="RECT" />
				<area alt="Reptiles" coords="140,270,210,340"
					href="shop/viewCategory.shtml?categoryId=REPTILES" shape="RECT" />
				<area alt="Cats" coords="225,240,295,310"
					href="shop/viewCategory.shtml?categoryId=CATS" shape="RECT" />
				<area alt="Birds" coords="280,180,350,250"
					href="shop/viewCategory.shtml?categoryId=BIRDS" shape="RECT" />
			</map>
			<img height="355" src="images/splash.gif" align="center"
				usemap="#estoremap" width="350" />
		</div>
	</div>

	<div id="Separator">&nbsp;</div>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>

