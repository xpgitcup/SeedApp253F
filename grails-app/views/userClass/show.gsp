
<%@ page import="cn.edu.cup.userLibs.UserClass" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'userClass.label', default: 'UserClass')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-userClass" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-userClass" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list userClass">
			
				<g:if test="${userClassInstance?.fields}">
				<li class="fieldcontain">
					<span id="fields-label" class="property-label"><g:message code="userClass.fields.label" default="Fields" /></span>
					
						<g:each in="${userClassInstance.fields}" var="f">
						<span class="property-value" aria-labelledby="fields-label"><g:link controller="userField" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userClassInstance?.lib}">
				<li class="fieldcontain">
					<span id="lib-label" class="property-label"><g:message code="userClass.lib.label" default="Lib" /></span>
					
						<span class="property-value" aria-labelledby="lib-label"><g:link controller="userLib" action="show" id="${userClassInstance?.lib?.id}">${userClassInstance?.lib?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${userClassInstance?.methods}">
				<li class="fieldcontain">
					<span id="methods-label" class="property-label"><g:message code="userClass.methods.label" default="Methods" /></span>
					
						<g:each in="${userClassInstance.methods}" var="m">
						<span class="property-value" aria-labelledby="methods-label"><g:link controller="userMethod" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${userClassInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="userClass.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${userClassInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:userClassInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${userClassInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
