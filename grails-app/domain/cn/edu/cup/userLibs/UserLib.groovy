package cn.edu.cup.userLibs

import java.util.Formatter.DateTime
import java.util.jar.JarFile
import java.util.jar.Manifest

class UserLib {

    def commonService
    
    String name
    String description
    String fileName
    String developer
    Date   uploadDate 
    
    static belongsTo = [libType: UserLibConfig]
    
    static hasMany = [classes: UserClass]
    
    static constraints = {
        name()
        description()
        fileName()
        developer()
        uploadDate()
    }
    
    String toString() {
        return "${name}/${description}"
    }
    
    def getEntries() {
        def file = new File(realFileName())
        JarFile jf = new JarFile(file)
        def ens = []
        def es = jf.entries()
        es.each() {e->
            println "${e}"
            ens.add("${e}")
        }
        return ens
    }
    
    String realPath() {
        def uc = libType.path
        def webRootDir = commonService.getServletContext().getRealPath("/")
        return "${webRootDir}/userLibs/${uc}"
    }
    
    String realFileName() {
        def path = realPath()
        def destDir = "${path}/${fileName}"
    }
    
    Boolean status() {
        def rfileName = realFileName() 
        def f = new File(rfileName)
        return f.exists()
    }
}
