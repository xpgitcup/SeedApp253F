
<%@ page import="cn.edu.cup.chart.ChartTopic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'chartTopic.label', default: 'ChartTopic')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-chartTopic" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-chartTopic" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="sayTo" title="${message(code: 'chartTopic.sayTo.label', default: 'Say To')}" />
					
						<g:sortableColumn property="topicContext" title="${message(code: 'chartTopic.topicContext.label', default: 'Topic Context')}" />
					
						<g:sortableColumn property="topicAuthor" title="${message(code: 'chartTopic.topicAuthor.label', default: 'Topic Author')}" />
					
						<g:sortableColumn property="startAt" title="${message(code: 'chartTopic.startAt.label', default: 'Start At')}" />
					
						<th><g:message code="chartTopic.upTopic.label" default="Up Topic" /></th>
					
						<th><g:message code="chartTopic.chartProject.label" default="Chart Project" /></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${chartTopicInstanceList}" status="i" var="chartTopicInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${chartTopicInstance.id}">${fieldValue(bean: chartTopicInstance, field: "sayTo")}</g:link></td>
					
						<td>${fieldValue(bean: chartTopicInstance, field: "topicContext")}</td>
					
						<td>${fieldValue(bean: chartTopicInstance, field: "topicAuthor")}</td>
					
						<td><g:formatDate date="${chartTopicInstance.startAt}" /></td>
					
						<td>${fieldValue(bean: chartTopicInstance, field: "upTopic")}</td>
					
						<td>${fieldValue(bean: chartTopicInstance, field: "chartProject")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${chartTopicInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
