
<%@ page import="cn.edu.cup.system.SystemMenu" %>
<!DOCTYPE html>
<html>
    <head>
        <meta name="layout" content="main">
        <title><g:message code="default.list.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="nav" role="navigation">
            <ul>
                <li>
                    <a class="home" href="${createLink(uri: '/')}">
                        <g:message code="default.home.label"/>
                    </a>
                </li>
                <li>
                    <g:link class="create" action="testUserLib">
                        用户类库测试
                    </g:link>
                </li>
                <li>
                    <g:link class="create" action="testQuery">
                        测试创建查询
                    </g:link>
                </li>
                <li>
                    <g:link class="create" action="testSystemMenuQuery">
                        测试获取查询字符串
                    </g:link>
                </li>
                <li>
                    <g:link class="create" action="resetMenuItemRights">
                        重置权限
                    </g:link>
                </li>
                </ul>
            </div>
            <div id="list-systemMenu" class="content scaffold-list" role="main">
                <h1><g:message code="default.list.label" args="[entityName]" /></h1>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>
            <table>
                <thead>
                    <tr>

                        <g:sortableColumn property="menuContext" title="${message(code: 'systemMenu.menuContext.label', default: 'Menu Context')}" />

                        <g:sortableColumn property="menuAction" title="${message(code: 'systemMenu.menuAction.label', default: 'Menu Action')}" />

                        <g:sortableColumn property="menuRight" title="${message(code: 'systemMenu.menuRight.label', default: 'Menu Right')}" />

                        <g:sortableColumn property="menuDescription" title="${message(code: 'systemMenu.menuDescription.label', default: 'Menu Description')}" />

                        <g:sortableColumn property="menuOrder" title="${message(code: 'systemMenu.menuOrder.label', default: 'Menu Order')}" />

                        <th><g:message code="systemMenu.upMenuItem.label" default="Up Menu Item" /></th>

                    </tr>
                </thead>
                <tbody>
                    <g:each in="${systemMenuInstanceList}" status="i" var="systemMenuInstance">
                        <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                            <td><g:link action="show" id="${systemMenuInstance.id}">${fieldValue(bean: systemMenuInstance, field: "menuContext")}</g:link></td>
                            <td>
                                <g:link action="createDomainQuery" id="${systemMenuInstance.id}" controller="testMenu">
                                    创建${fieldValue(bean: systemMenuInstance, field: "menuContext")}查询
                                </g:link>
                            </td>

                            <!--
                            <td>
                                <g:nativeCode object="${systemMenuInstance}" method="treeViewString" parameter="9">
                                </g:nativeCode>
                            </td>
                            -->
                            <td>${fieldValue(bean: systemMenuInstance, field: "menuAction")}</td>

                            <td>${fieldValue(bean: systemMenuInstance, field: "menuRight")}</td>

                            <td>${fieldValue(bean: systemMenuInstance, field: "menuDescription")}</td>

                            <td>${fieldValue(bean: systemMenuInstance, field: "menuOrder")}</td>

                            <td>${fieldValue(bean: systemMenuInstance, field: "upMenuItem")}</td>

                        </tr>
                    </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${systemMenuInstanceCount ?: 0}" />
            </div>
        </div>
    </body>
</html>
