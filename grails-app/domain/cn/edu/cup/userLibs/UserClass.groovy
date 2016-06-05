package cn.edu.cup.userLibs

class UserClass {

    String name
    
    static belongsTo = [lib: UserLib]
    
    static hasMany = [methods: UserMethod, fields: UserField]
    
    static constraints = {
    }
    
    String toString() {
        return "${name}"
    }
    
    /*
     * 调入类的代码
     * */
    def loadClass() {
        ClassLoader parent = getClass().getClassLoader(); 
        GroovyClassLoader loader = new GroovyClassLoader(parent);  
        def libFile = new File(lib.realFileName())
        println "classInstance ${libFile}"
        loader.addURL(libFile.toURL())
        //def clazz = loader.parseClass(name)
        def clazz = loader.loadClass(name)
        println "classInstance ${clazz}"
        return clazz
    }

    /*
     * 创建类的实例
     * */
    def classInstance() {
        def object = loadClass().newInstance()
        return object
    }

    /*
     * 返回类定义的方法
     * */
    def classInstanceMethods() {
        def cc = loadClass()
        def ms = cc.getDeclaredMethods()
        return ms
    }

    /*
     * 返回类定义的字段
     * */
    def classInstanceFields() {
        def cc = loadClass()
        def ms = cc.getDeclaredFields()
        return ms
    }

}
