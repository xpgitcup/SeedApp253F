package cn.edu.cup.system

import groovy.xml.MarkupBuilder

class SystemMenu {

    String menuContext
    String menuAction
    int menuRight
    String menuDescription
    int menuOrder
    SystemMenu upMenuItem

    static hasMany = [menuItems: SystemMenu]

    static constraints = {
        menuContext()
        menuAction()
        menuRight()
        menuDescription()
        menuOrder()
        upMenuItem(nullable: true)
    }

    static mapping = {
        sort('menuOrder')
        sort('id')
        menuItems sort: 'menuOrder', 'id'  //这是排序的标准做法 
    }

    /*
    * 当前菜单的缺省权限=上级菜单的权限
    * */

    def beforeInsert() {
        if (upMenuItem) {
            menuRight = upMenuItem.menuRight
        }
    }

    String toString() {
        return "${menuContext}(${menuRight})"
    }

    /*
    * 重置所有菜单的权限
    * */

    static resetMenuRights(upMenu) {
        def q = createCriteria()
        def menuList
        if (upMenu) {
            menuList = q.list {
                eq('upMenuItem', upMenu)
            }
        } else {
            menuList = q.list {
                isNull('upMenuItem')
            }
        }
        menuList.each { e ->
            if (e.upMenuItem) {
                e.menuRight = e.upMenuItem.menuRight
                println("${e}--->${e.upMenuItem}")
                e.save()
            }
            resetMenuRights(e)
        }
    }

    //获取顶级菜单的标题
    String topMenuContext() {
        def menuItem = this
        while (menuItem.upMenuItem) {
            menuItem = menuItem.upMenuItem
        }
        return menuItem.menuContext
    }

    /*
    * 返回有权限的菜单
    * */

    def visibleMenuItems(userRight) {
        def q = createCriteria()
        def systemMenuList;
        systemMenuList = q.list() {
            ge('menuRight', userRight)
            isNull('upMenuItem')
        }
        return systemMenuList
    }

    /**
     * 返回树形的字符串
     * */
    String treeViewString(userRight) {
        def writer = new StringWriter()
        def ulString = new MarkupBuilder(writer)
        def mlist = visibleMenuItems(userRight)
        println("??:  ${mlist}")
        makeUlString(mlist, userRight, ulString)
        println("String：")
        println(writer.toString())

        return writer.toString()
    }

    /**
     * 构造ul字符串
     * */
    def makeUlString(mlist, userRight, ulString) {
        ulString.ul([class: 'easyui-tree']) {
            mlist.each() { e ->
                li([id: "${id}"]) {
                    span("${e.menuContext}")
                    def subMenuItems = e.menuItems
                    if (subMenuItems) {
                        makeUlString(subMenuItems, userRight, ulString)
                    }
                }
            }
        }
    }

    /*
     * 返回以当前菜单为根节点的序列 
     * */

    String currentTree() {
        def writer = new StringWriter()
        def ulString = new MarkupBuilder(writer)

        ulString.ul() {
            li([id: "${id}"]) {
                span("${menuContext}")
            }
        }

        return writer.toString()
    }

}
