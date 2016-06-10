
<%@ page import="cn.edu.cup.chart.ChartTopic" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'chartTopic.label', default: 'ChartTopic')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-chartTopic" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-chartTopic" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list chartTopic">
			
				<g:if test="${chartTopicInstance?.sayTo}">
				<li class="fieldcontain">
					<span id="sayTo-label" class="property-label"><g:message code="chartTopic.sayTo.label" default="Say To" /></span>
					
						<span class="property-value" aria-labelledby="sayTo-label"><g:fieldValue bean="${chartTopicInstance}" field="sayTo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chartTopicInstance?.topicContext}">
				<li class="fieldcontain">
					<span id="topicContext-label" class="property-label"><g:message code="chartTopic.topicContext.label" default="Topic Context" /></span>
					
						<span class="property-value" aria-labelledby="topicContext-label"><g:fieldValue bean="${chartTopicInstance}" field="topicContext"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chartTopicInstance?.topicAuthor}">
				<li class="fieldcontain">
					<span id="topicAuthor-label" class="property-label"><g:message code="chartTopic.topicAuthor.label" default="Topic Author" /></span>
					
						<span class="property-value" aria-labelledby="topicAuthor-label"><g:fieldValue bean="${chartTopicInstance}" field="topicAuthor"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${chartTopicInstance?.startAt}">
				<li class="fieldcontain">
					<span id="startAt-label" class="property-label"><g:message code="chartTopic.startAt.label" default="Start At" /></span>
					
						<span class="property-value" aria-labelledby="startAt-label"><g:formatDate date="${chartTopicInstance?.startAt}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${chartTopicInstance?.upTopic}">
				<li class="fieldcontain">
					<span id="upTopic-label" class="property-label"><g:message code="chartTopic.upTopic.label" default="Up Topic" /></span>
					
						<span class="property-value" aria-labelledby="upTopic-label"><g:link controller="chartTopic" action="show" id="${chartTopicInstance?.upTopic?.id}">${chartTopicInstance?.upTopic?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${chartTopicInstance?.chartProject}">
				<li class="fieldcontain">
					<span id="chartProject-label" class="property-label"><g:message code="chartTopic.chartProject.label" default="Chart Project" /></span>
					
						<span class="property-value" aria-labelledby="chartProject-label"><g:link controller="chartProject" action="show" id="${chartTopicInstance?.chartProject?.id}">${chartTopicInstance?.chartProject?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${chartTopicInstance?.subTopic}">
				<li class="fieldcontain">
					<span id="subTopic-label" class="property-label"><g:message code="chartTopic.subTopic.label" default="Sub Topic" /></span>
					
						<g:each in="${chartTopicInstance.subTopic}" var="s">
						<span class="property-value" aria-labelledby="subTopic-label"><g:link controller="chartTopic" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:chartTopicInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${chartTopicInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
