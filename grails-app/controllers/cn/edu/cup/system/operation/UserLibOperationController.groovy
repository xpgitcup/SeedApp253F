package cn.edu.cup.system.operation

import cn.edu.cup.userLibs.UserField
import cn.edu.cup.userLibs.UserLib
import cn.edu.cup.userLibs.UserClass
import cn.edu.cup.userLibs.UserMethod
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserLibOperationController {

    def commonService

    def checkStatus(fileName) {
        def sf = new File(fileName)
        return sf.exists()
    }
    
    @Transactional
    def doUploadUserLib(UserLib userLibInstanceInstance) {
        
        def nfileName = params.uploadedFile.originalFilename
        println "准备上传：${nfileName}"

        params.destDir = userLibInstanceInstance.realPath()
        
        def cfile = new File("${userLibInstanceInstance.realPath()}/${nfileName}")
        def destFile = commonService.upload(params)
        println "${destFile}"
        userLibInstanceInstance.fileName = nfileName
        userLibInstanceInstance.save(flush:true)
        println "上传成功......"
        def clnames = userLibInstanceInstance.getEntries()
        clnames.each() {e->
            if (e.contains('.class')) {
                println "?? ${e}"
                def k = e.lastIndexOf('.class')
                def cn = e.substring(0, k).replace('/', '.')    //e.substring(k+1)
                println "c: ${cn}"
                def nc = new UserClass(name: cn, lib: userLibInstanceInstance)
                nc.save(flush: true)
                
                def object = nc.classInstance()
                def ms = nc.classInstanceMethods()
                ms.each() {ee->
                    def nm = new UserMethod(name: ee.name, clazz: nc)
                    nm.save(flush: true)
                    println "method ${ee}"
                }

                def fs = nc.classInstanceFields()
                fs.each {ef->
                    def ff = new UserField(name: ef.name, clazz: nc)
                    ff.save(flush: true)
                    println "field ${ff}"
                }
            }
        }

        redirect(action:"index")
    }
    
    def prepareUploadUserLib() {
        respond new UserLib(params)
    }
    
    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        def theList = UserLib.list(params)
        model:[
            userLibInstanceInstanceList: theList,
            //status: status,
            userLibInstanceInstanceCount: UserLib.count()
        ]
    }

    
}
