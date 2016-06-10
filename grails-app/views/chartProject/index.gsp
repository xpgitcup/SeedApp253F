
<%@ page import="cn.edu.cup.chart.ChartProject" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main_0">
		<g:set var="entityName" value="${message(code: 'chartProject.label', default: 'ChartProject')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-chartProject" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-chartProject" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="projectName" title="${message(code: 'chartProject.projectName.label', default: 'Project Name')}" />
					
						<g:sortableColumn property="projectAuthor" title="${message(code: 'chartProject.projectAuthor.label', default: 'Project Author')}" />
					
						<g:sortableColumn property="startAt" title="${message(code: 'chartProject.startAt.label', default: 'Start At')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${chartProjectInstanceList}" status="i" var="chartProjectInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${chartProjectInstance.id}">${fieldValue(bean: chartProjectInstance, field: "projectName")}</g:link></td>
					
						<td>${fieldValue(bean: chartProjectInstance, field: "projectAuthor")}</td>
					
						<td><g:formatDate date="${chartProjectInstance.startAt}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${chartProjectInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
