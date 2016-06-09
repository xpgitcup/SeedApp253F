<%@ page import="cn.edu.cup.query.DomainQuery" %>



<div class="fieldcontain ${hasErrors(bean: domainQueryInstance, field: 'clazzName', 'error')} required">
	<label for="clazzName">
		<g:message code="domainQuery.clazzName.label" default="Clazz Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="clazzName" required="" value="${domainQueryInstance?.clazzName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: domainQueryInstance, field: 'sqlString', 'error')} ">
	<label for="sqlString">
		<g:message code="domainQuery.sqlString.label" default="Sql String" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${domainQueryInstance?.sqlString?}" var="s">
    <li><g:link controller="queryString" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="queryString" action="create" params="['domainQuery.id': domainQueryInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'queryString.label', default: 'QueryString')])}</g:link>
</li>
</ul>


</div>

