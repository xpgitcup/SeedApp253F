<%@ page import="cn.edu.cup.query.QueryString" %>



<div class="fieldcontain ${hasErrors(bean: queryStringInstance, field: 'clazz', 'error')} required">
	<label for="clazz">
		<g:message code="queryString.clazz.label" default="Clazz" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="clazz" name="clazz.id" from="${cn.edu.cup.query.DomainQuery.list()}" optionKey="id" required="" value="${queryStringInstance?.clazz?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: queryStringInstance, field: 'comment', 'error')} required">
	<label for="comment">
		<g:message code="queryString.comment.label" default="Comment" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="comment" required="" value="${queryStringInstance?.comment}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: queryStringInstance, field: 'sqlString', 'error')} required">
	<label for="sqlString">
		<g:message code="queryString.sqlString.label" default="Sql String" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sqlString" required="" value="${queryStringInstance?.sqlString}"/>

</div>

