
<%@ page import="cn.edu.cup.query.QueryString" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main_0">
		<g:set var="entityName" value="${message(code: 'queryString.label', default: 'QueryString')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-queryString" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-queryString" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list queryString">
			
				<g:if test="${queryStringInstance?.clazz}">
				<li class="fieldcontain">
					<span id="clazz-label" class="property-label"><g:message code="queryString.clazz.label" default="Clazz" /></span>
					
						<span class="property-value" aria-labelledby="clazz-label"><g:link controller="domainQuery" action="show" id="${queryStringInstance?.clazz?.id}">${queryStringInstance?.clazz?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${queryStringInstance?.comment}">
				<li class="fieldcontain">
					<span id="comment-label" class="property-label"><g:message code="queryString.comment.label" default="Comment" /></span>
					
						<span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${queryStringInstance}" field="comment"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${queryStringInstance?.sqlString}">
				<li class="fieldcontain">
					<span id="sqlString-label" class="property-label"><g:message code="queryString.sqlString.label" default="Sql String" /></span>
					
						<span class="property-value" aria-labelledby="sqlString-label"><g:fieldValue bean="${queryStringInstance}" field="sqlString"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:queryStringInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${queryStringInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
