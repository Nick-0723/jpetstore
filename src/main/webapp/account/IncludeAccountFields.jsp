<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h3>Account Information</h3>

<table>
	<tr>
		<td>First name:</td>
		<td><input type="text" name="account.firstName" value="${account.firstName }" /></td>
	</tr>
	<tr>
		<td>Last name:</td>
		<td><input type="text" name="account.lastName" value="${account.lastName }" /></td>
	</tr>
	<tr>
		<td>Email:</td>
		<td><input type="text" size="40" name="account.email" value="${account.email }" /></td>
	</tr>
	<tr>
		<td>Phone:</td>
		<td><input type="text" name="account.phone" value="${account.phone }" /></td>
	</tr>
	<tr>
		<td>Address 1:</td>
		<td><input type="text" size="40" name="account.address1" value="${account.address1 }" /></td>
	</tr>
	<tr>
		<td>Address 2:</td>
		<td><input type="text" size="40" name="account.address2" value="${account.address2 }" /></td>
	</tr>
	<tr>
		<td>City:</td>
		<td><input type="text" name="account.city" value="${account.city }" /></td>
	</tr>
	<tr>
		<td>State:</td>
		<td><input type="text" size="4" name="account.state" value="${account.state }" /></td>
	</tr>
	<tr>
		<td>Zip:</td>
		<td><input type="text" size="10" name="account.zip" value="${account.zip }" /></td>
	</tr>
	<tr>
		<td>Country:</td>
		<td><input type="text" size="15" name="account.country" value="${account.country }" /></td>
	</tr>
</table>

<h3>Profile Information</h3>

<table>
	<tr>
		<td>Language Preference:</td>
		<td><select name="account.languagePreference">
				<c:forEach var="op" items="${languages}">
					<option value="${op}" >${op}</option>
				</c:forEach>
		</select></td>
	</tr>
	<tr>
		<td>Favourite Category:</td>
		<td><select name="account.favouriteCategoryId">
				<c:forEach var="op" items="${categories}">
					<option value="${op}" >${op}</option>
				</c:forEach>
		</select></td>
	</tr>
	<tr>
		<td>Enable MyList</td>
		<td><input type="checkbox" name="account.listOption" value="true" /></td>
	</tr>
	<tr>
		<td>Enable MyBanner</td>
		<td><input type="checkbox" name="account.bannerOption" value="true" /></td>
	</tr>

</table>
