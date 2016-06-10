
<%@ page import="cn.edu.cup.userLibs.UserMethod" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main_0">
		<g:set var="entityName" value="${message(code: 'userMethod.label', default: 'UserMethod')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userMethod" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userMethod" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<th><g:message code="userMethod.clazz.label" default="Clazz" /></th>
					
						<g:sortableColumn property="name" title="${message(code: 'userMethod.name.label', default: 'Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userMethodInstanceList}" status="i" var="userMethodInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userMethodInstance.id}">${fieldValue(bean: userMethodInstance, field: "clazz")}</g:link></td>
					
						<td>${fieldValue(bean: userMethodInstance, field: "name")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userMethodInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
