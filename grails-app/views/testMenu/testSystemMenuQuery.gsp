<%@ page import="cn.edu.cup.query.QueryString" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main_0">
    <g:set var="entityName" value="${message(code: 'queryString.label', default: 'QueryString')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-queryString" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                  default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li>
            <a class="home" href="${createLink(uri: '/')}">
                <g:message code="default.home.label"/>
            </a>
        </li>
    </ul>
</div>

<div id="list-queryString" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <th><g:message code="queryString.clazz.label" default="Clazz"/></th>

            <g:sortableColumn property="comment"
                              title="${message(code: 'queryString.comment.label', default: 'Comment')}"/>

            <g:sortableColumn property="sqlString"
                              title="${message(code: 'queryString.sqlString.label', default: 'Sql String')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${queryStringInstanceList}" status="i" var="queryStringInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="executeQuery"
                            id="${queryStringInstance.id}" params="[clazz:'${clazz}']">
                    ${fieldValue(bean: queryStringInstance, field: "clazz")}
                </g:link>
                </td>

                <td>${fieldValue(bean: queryStringInstance, field: "comment")}</td>

                <td>${fieldValue(bean: queryStringInstance, field: "sqlString")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${queryStringInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
