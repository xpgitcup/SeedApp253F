package cn.edu.cup.userLibs



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserMethodController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UserMethod.list(params), model:[userMethodInstanceCount: UserMethod.count()]
    }

    def show(UserMethod userMethodInstance) {
        respond userMethodInstance
    }

    def create() {
        respond new UserMethod(params)
    }

    @Transactional
    def save(UserMethod userMethodInstance) {
        if (userMethodInstance == null) {
            notFound()
            return
        }

        if (userMethodInstance.hasErrors()) {
            respond userMethodInstance.errors, view:'create'
            return
        }

        userMethodInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userMethod.label', default: 'UserMethod'), userMethodInstance.id])
                redirect userMethodInstance
            }
            '*' { respond userMethodInstance, [status: CREATED] }
        }
    }

    def edit(UserMethod userMethodInstance) {
        respond userMethodInstance
    }

    @Transactional
    def update(UserMethod userMethodInstance) {
        if (userMethodInstance == null) {
            notFound()
            return
        }

        if (userMethodInstance.hasErrors()) {
            respond userMethodInstance.errors, view:'edit'
            return
        }

        userMethodInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UserMethod.label', default: 'UserMethod'), userMethodInstance.id])
                redirect userMethodInstance
            }
            '*'{ respond userMethodInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UserMethod userMethodInstance) {

        if (userMethodInstance == null) {
            notFound()
            return
        }

        userMethodInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserMethod.label', default: 'UserMethod'), userMethodInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userMethod.label', default: 'UserMethod'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
