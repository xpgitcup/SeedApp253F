<%@ page import="cn.edu.cup.userLibs.UserMethod" %>



<div class="fieldcontain ${hasErrors(bean: userMethodInstance, field: 'clazz', 'error')} required">
	<label for="clazz">
		<g:message code="userMethod.clazz.label" default="Clazz" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="clazz" name="clazz.id" from="${cn.edu.cup.userLibs.UserClass.list()}" optionKey="id" required="" value="${userMethodInstance?.clazz?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userMethodInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="userMethod.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${userMethodInstance?.name}"/>

</div>

