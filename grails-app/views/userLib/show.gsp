
<%@ page import="cn.edu.cup.userLibs.UserLib" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userLib.label', default: 'UserLib')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-userLib" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-userLib" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userLib">
			
				<g:if test="${userLibInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="userLib.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${userLibInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userLibInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="userLib.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${userLibInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userLibInstance?.fileName}">
				<li class="fieldcontain">
					<span id="fileName-label" class="property-label"><g:message code="userLib.fileName.label" default="File Name" /></span>
					
						<span class="property-value" aria-labelledby="fileName-label"><g:fieldValue bean="${userLibInstance}" field="fileName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userLibInstance?.developer}">
				<li class="fieldcontain">
					<span id="developer-label" class="property-label"><g:message code="userLib.developer.label" default="Developer" /></span>
					
						<span class="property-value" aria-labelledby="developer-label"><g:fieldValue bean="${userLibInstance}" field="developer"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${userLibInstance?.uploadDate}">
				<li class="fieldcontain">
					<span id="uploadDate-label" class="property-label"><g:message code="userLib.uploadDate.label" default="Upload Date" /></span>
					
						<span class="property-value" aria-labelledby="uploadDate-label"><g:formatDate date="${userLibInstance?.uploadDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${userLibInstance?.classes}">
				<li class="fieldcontain">
					<span id="classes-label" class="property-label"><g:message code="userLib.classes.label" default="Classes" /></span>
					
						<g:each in="${userLibInstance.classes}" var="c">
						<span class="property-value" aria-labelledby="classes-label"><g:link controller="userClass" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userLibInstance?.libType}">
				<li class="fieldcontain">
					<span id="libType-label" class="property-label"><g:message code="userLib.libType.label" default="Lib Type" /></span>
					
						<span class="property-value" aria-labelledby="libType-label"><g:link controller="userLibConfig" action="show" id="${userLibInstance?.libType?.id}">${userLibInstance?.libType?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:userLibInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${userLibInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
