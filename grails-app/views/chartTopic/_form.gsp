<%@ page import="cn.edu.cup.chart.ChartTopic" %>



<div class="fieldcontain ${hasErrors(bean: chartTopicInstance, field: 'sayTo', 'error')} required">
	<label for="sayTo">
		<g:message code="chartTopic.sayTo.label" default="Say To" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="sayTo" required="" value="${chartTopicInstance?.sayTo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chartTopicInstance, field: 'topicContext', 'error')} required">
	<label for="topicContext">
		<g:message code="chartTopic.topicContext.label" default="Topic Context" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="topicContext" required="" value="${chartTopicInstance?.topicContext}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chartTopicInstance, field: 'topicAuthor', 'error')} required">
	<label for="topicAuthor">
		<g:message code="chartTopic.topicAuthor.label" default="Topic Author" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="topicAuthor" required="" value="${chartTopicInstance?.topicAuthor}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chartTopicInstance, field: 'startAt', 'error')} required">
	<label for="startAt">
		<g:message code="chartTopic.startAt.label" default="Start At" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startAt" precision="day"  value="${chartTopicInstance?.startAt}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: chartTopicInstance, field: 'upTopic', 'error')} ">
	<label for="upTopic">
		<g:message code="chartTopic.upTopic.label" default="Up Topic" />
		
	</label>
	<g:select id="upTopic" name="upTopic.id" from="${cn.edu.cup.chart.ChartTopic.list()}" optionKey="id" value="${chartTopicInstance?.upTopic?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chartTopicInstance, field: 'chartProject', 'error')} required">
	<label for="chartProject">
		<g:message code="chartTopic.chartProject.label" default="Chart Project" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="chartProject" name="chartProject.id" from="${cn.edu.cup.chart.ChartProject.list()}" optionKey="id" required="" value="${chartTopicInstance?.chartProject?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: chartTopicInstance, field: 'subTopic', 'error')} ">
	<label for="subTopic">
		<g:message code="chartTopic.subTopic.label" default="Sub Topic" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${chartTopicInstance?.subTopic?}" var="s">
    <li><g:link controller="chartTopic" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="chartTopic" action="create" params="['chartTopic.id': chartTopicInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'chartTopic.label', default: 'ChartTopic')])}</g:link>
</li>
</ul>


</div>

