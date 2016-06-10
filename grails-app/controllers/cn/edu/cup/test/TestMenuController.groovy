package cn.edu.cup.test

import cn.edu.cup.query.DomainQuery
import cn.edu.cup.query.QueryString
import cn.edu.cup.system.SystemMenu
import cn.edu.cup.userLibs.UserLib
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TestMenuController {

    def queryService

    /*
    * 重置所有菜单的权限
    * */

    @Transactional
    def resetMenuItemRights() {
        SystemMenu.resetMenuRights(null)
        redirect(action: "index", controller: "systemMenu")
    }

    /*
    * 获取针对该类的所有查询字符串的列表
    * */
    def testSystemMenuQuery() {
        def queryList = queryService.getAllQueryStrings(SystemMenu)
        model:[queryStringInstanceList: queryList, clazz: SystemMenu.class]
    }

    /*
    * 执行查询
    * */
    def executeQuery() {
        println("测试查询的执行情况：${params}")
        def sql = QueryString.get(params.id)
        def clazz = params.clazz
        println("传递过来的是：${clazz}")
        def list = SystemMenu.executeQuery(sql.sqlString)
        model:[systemMenuInstanceList: list]
    }

    def testQuery(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond QueryString.list(params), model:[queryStringInstanceCount: QueryString.count()]
    }

    @Transactional
    def createDomainQuery() {
        println(params)
        def o = SystemMenu.get(params.id)
        params.clazzName = o.class.name
        def found = DomainQuery.findByClazzName(params.clazzName)
        if (!found) {
            def domainQueryInstance = new DomainQuery(params)
            domainQueryInstance.save(flush: true)
        }
        redirect(action: "index", controller: "domainQuery")
    }

    def calculate(TestDataA a) {
        def userLib = UserLib.get(1)
        def fileName = userLib.fileName
        
        ClassLoader parent = getClass().getClassLoader(); 
        GroovyClassLoader loader = new GroovyClassLoader(parent);   
        
        def file = new File(userLib.realFileName())
        
        loader.addURL(file.toURL())
        
        def className = "cn.edu.cup.test.UserLib4TestDataA"
        
        def clazz = loader.loadClass(className)
        println "${clazz}"
        
        def cs = loader.getLoadedClasses();
        println "类？？${cs}"
        cs.each() {e->
            println "测试： ${e}"
        }
        
        
        def object = clazz.newInstance()
        
        def aa = TestDataA.get(a.id)
        def value = object.invokeMethod("calculator", aa)
        
        def ms = object.class.getDeclaredMethods()
        ms.each() {e->
            println "......${e}"
        }
        
        object = null
        
        return [fileName: fileName, value: value];
    }
    
    def testUserLib(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def theList = TestDataA.list(params)
        def theResult = []
        theList.each() {e->
            theResult.add(calculate(e))
        }
        model:[
            testDataAInstanceList: theList,
            theResult: theResult,
            testDataAInstanceCount: TestDataA.count()
        ]
    }
    
    def show(SystemMenu systemMenuInstance) {
        respond systemMenuInstance
    }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond SystemMenu.list(params), model:[systemMenuInstanceCount: SystemMenu.count()]
    }
    
}
