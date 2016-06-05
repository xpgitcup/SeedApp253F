package cn.edu.cup.system

import groovy.xml.MarkupBuilder

class SystemMenu {
    
    String menuContext
    String menuAction
    int    menuRight
    String menuDescription
    int    menuOrder
    SystemMenu upMenuItem
    
    static hasMany = [menuItems: SystemMenu]
    
    static constraints = {
        menuContext()
        menuAction()
        menuRight()
        menuDescription()
        menuOrder()
        upMenuItem(nullable:true)
    }
    
    static mapping = {
        sort('menuOrder')
        sort('id')
        menuItems sort: 'menuOrder', 'id'  //这是排序的标准做法 
    }
    
    String toString() {
        return "${menuContext}(${menuRight})"
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
    SystemMenu[] visibleMenuItems(userRight) {
        def q = SystemMenu.createCriteria()
        def systemMenuList;
        systemMenuList = q.list() {
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
     *构造ul字符串
     * */
    def makeUlString(mlist, userRight, ulString) {
        ulString.ul() {
            mlist.each() {e->
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
