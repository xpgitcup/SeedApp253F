
<%@ page import="cn.edu.cup.query.DomainQuery" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'domainQuery.label', default: 'DomainQuery')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-domainQuery" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-domainQuery" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list domainQuery">
			
				<g:if test="${domainQueryInstance?.clazzName}">
				<li class="fieldcontain">
					<span id="clazzName-label" class="property-label"><g:message code="domainQuery.clazzName.label" default="Clazz Name" /></span>
					
						<span class="property-value" aria-labelledby="clazzName-label"><g:fieldValue bean="${domainQueryInstance}" field="clazzName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${domainQueryInstance?.sqlString}">
				<li class="fieldcontain">
					<span id="sqlString-label" class="property-label"><g:message code="domainQuery.sqlString.label" default="Sql String" /></span>
					
						<g:each in="${domainQueryInstance.sqlString}" var="s">
						<span class="property-value" aria-labelledby="sqlString-label"><g:link controller="queryString" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:domainQueryInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${domainQueryInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
