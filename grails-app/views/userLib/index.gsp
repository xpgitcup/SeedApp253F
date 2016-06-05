
<%@ page import="cn.edu.cup.userLibs.UserLib" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userLib.label', default: 'UserLib')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-userLib" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-userLib" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'userLib.name.label', default: 'Name')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'userLib.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="fileName" title="${message(code: 'userLib.fileName.label', default: 'File Name')}" />
					
						<g:sortableColumn property="developer" title="${message(code: 'userLib.developer.label', default: 'Developer')}" />
					
						<g:sortableColumn property="uploadDate" title="${message(code: 'userLib.uploadDate.label', default: 'Upload Date')}" />
					
						<th><g:message code="userLib.libType.label" default="Lib Type" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userLibInstanceList}" status="i" var="userLibInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userLibInstance.id}">${fieldValue(bean: userLibInstance, field: "name")}</g:link></td>
					
						<td>${fieldValue(bean: userLibInstance, field: "description")}</td>
					
						<td>${fieldValue(bean: userLibInstance, field: "fileName")}</td>
					
						<td>${fieldValue(bean: userLibInstance, field: "developer")}</td>
					
						<td><g:formatDate date="${userLibInstance.uploadDate}" /></td>
					
						<td>${fieldValue(bean: userLibInstance, field: "libType")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userLibInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
