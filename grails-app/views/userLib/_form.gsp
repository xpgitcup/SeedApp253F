<%@ page import="cn.edu.cup.userLibs.UserLib" %>



<div class="fieldcontain ${hasErrors(bean: userLibInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="userLib.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${userLibInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userLibInstance, field: 'description', 'error')} required">
	<label for="description">
		<g:message code="userLib.description.label" default="Description" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="description" required="" value="${userLibInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userLibInstance, field: 'fileName', 'error')} required">
	<label for="fileName">
		<g:message code="userLib.fileName.label" default="File Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="fileName" required="" value="${userLibInstance?.fileName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userLibInstance, field: 'developer', 'error')} required">
	<label for="developer">
		<g:message code="userLib.developer.label" default="Developer" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="developer" required="" value="${userLibInstance?.developer}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: userLibInstance, field: 'uploadDate', 'error')} required">
	<label for="uploadDate">
		<g:message code="userLib.uploadDate.label" default="Upload Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="uploadDate" precision="day"  value="${userLibInstance?.uploadDate}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: userLibInstance, field: 'classes', 'error')} ">
	<label for="classes">
		<g:message code="userLib.classes.label" default="Classes" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${userLibInstance?.classes?}" var="c">
    <li><g:link controller="userClass" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="userClass" action="create" params="['userLib.id': userLibInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'userClass.label', default: 'UserClass')])}</g:link>
</li>
</ul>


</div>

<div class="fieldcontain ${hasErrors(bean: userLibInstance, field: 'libType', 'error')} required">
	<label for="libType">
		<g:message code="userLib.libType.label" default="Lib Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="libType" name="libType.id" from="${cn.edu.cup.userLibs.UserLibConfig.list()}" optionKey="id" required="" value="${userLibInstance?.libType?.id}" class="many-to-one"/>

</div>

