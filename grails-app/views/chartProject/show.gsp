
<%@ page import="cn.edu.cup.chart.ChartProject" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'chartProject.label', default: 'ChartProject')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-chartProject" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-chartProject" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list chartProject">
			
				<g:if test="${chartProjectInstance?.projectName}">
				<li class="fieldcontain">
					<span id="projectName-label" class="property-label"><g:message code="chartProject.projectName.label" default="Project Name" /></span>
					
						<span class="property-value" aria-labelledby="projectName-label"><g:fieldValue bean="${chartProjectInstance}" field="projectName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chartProjectInstance?.projectAuthor}">
				<li class="fieldcontain">
					<span id="projectAuthor-label" class="property-label"><g:message code="chartProject.projectAuthor.label" default="Project Author" /></span>
					
						<span class="property-value" aria-labelledby="projectAuthor-label"><g:fieldValue bean="${chartProjectInstance}" field="projectAuthor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chartProjectInstance?.startAt}">
				<li class="fieldcontain">
					<span id="startAt-label" class="property-label"><g:message code="chartProject.startAt.label" default="Start At" /></span>
					
						<span class="property-value" aria-labelledby="startAt-label"><g:formatDate date="${chartProjectInstance?.startAt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chartProjectInstance?.chartTopic}">
				<li class="fieldcontain">
					<span id="chartTopic-label" class="property-label"><g:message code="chartProject.chartTopic.label" default="Chart Topic" /></span>
					
						<g:each in="${chartProjectInstance.chartTopic}" var="c">
						<span class="property-value" aria-labelledby="chartTopic-label"><g:link controller="charTopic" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:chartProjectInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${chartProjectInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
