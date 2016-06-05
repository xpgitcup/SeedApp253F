<%@ page import="cn.edu.cup.userLibs.UserClass" %>



<div class="fieldcontain ${hasErrors(bean: userClassInstance, field: 'fields', 'error')} ">
	<label for="fields">
		<g:message code="userClass.fields.label" default="Fields" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userClassInstance?.fields?}" var="f">
    <li><g:link controller="userField" action="show" id="${f.id}">${f?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="userField" action="create" params="['userClass.id': userClassInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'userField.label', default: 'UserField')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: userClassInstance, field: 'lib', 'error')} required">
	<label for="lib">
		<g:message code="userClass.lib.label" default="Lib" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="lib" name="lib.id" from="${cn.edu.cup.userLibs.UserLib.list()}" optionKey="id" required="" value="${userClassInstance?.lib?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userClassInstance, field: 'methods', 'error')} ">
	<label for="methods">
		<g:message code="userClass.methods.label" default="Methods" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userClassInstance?.methods?}" var="m">
    <li><g:link controller="userMethod" action="show" id="${m.id}">${m?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="userMethod" action="create" params="['userClass.id': userClassInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'userMethod.label', default: 'UserMethod')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: userClassInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="userClass.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${userClassInstance?.name}"/>

</div>

