<%@ page import="cn.edu.cup.userLibs.UserField" %>



<div class="fieldcontain ${hasErrors(bean: userFieldInstance, field: 'clazz', 'error')} required">
	<label for="clazz">
		<g:message code="userField.clazz.label" default="Clazz" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="clazz" name="clazz.id" from="${cn.edu.cup.userLibs.UserClass.list()}" optionKey="id" required="" value="${userFieldInstance?.clazz?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userFieldInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="userField.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${userFieldInstance?.name}"/>

</div>

