<%@ page import="cn.edu.cup.chart.ChartProject" %>



<div class="fieldcontain ${hasErrors(bean: chartProjectInstance, field: 'projectName', 'error')} required">
	<label for="projectName">
		<g:message code="chartProject.projectName.label" default="Project Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="projectName" required="" value="${chartProjectInstance?.projectName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chartProjectInstance, field: 'projectAuthor', 'error')} required">
	<label for="projectAuthor">
		<g:message code="chartProject.projectAuthor.label" default="Project Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="projectAuthor" required="" value="${chartProjectInstance?.projectAuthor}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chartProjectInstance, field: 'startAt', 'error')} required">
	<label for="startAt">
		<g:message code="chartProject.startAt.label" default="Start At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startAt" precision="day"  value="${chartProjectInstance?.startAt}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: chartProjectInstance, field: 'chartTopic', 'error')} ">
	<label for="chartTopic">
		<g:message code="chartProject.chartTopic.label" default="Chart Topic" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${chartProjectInstance?.chartTopic?}" var="c">
    <li><g:link controller="charTopic" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="charTopic" action="create" params="['chartProject.id': chartProjectInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'charTopic.label', default: 'ChartTopic')])}</g:link>
</li>
</ul>


</div>

