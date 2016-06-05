package cn.edu.cup.userLibs



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserLibController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UserLib.list(params), model:[userLibInstanceCount: UserLib.count()]
    }

    def show(UserLib userLibInstance) {
        respond userLibInstance
    }

    def create() {
        respond new UserLib(params)
    }

    @Transactional
    def save(UserLib userLibInstance) {
        if (userLibInstance == null) {
            notFound()
            return
        }

        if (userLibInstance.hasErrors()) {
            respond userLibInstance.errors, view:'create'
            return
        }

        userLibInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userLib.label', default: 'UserLib'), userLibInstance.id])
                redirect userLibInstance
            }
            '*' { respond userLibInstance, [status: CREATED] }
        }
    }

    def edit(UserLib userLibInstance) {
        respond userLibInstance
    }

    @Transactional
    def update(UserLib userLibInstance) {
        if (userLibInstance == null) {
            notFound()
            return
        }

        if (userLibInstance.hasErrors()) {
            respond userLibInstance.errors, view:'edit'
            return
        }

        userLibInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UserLib.label', default: 'UserLib'), userLibInstance.id])
                redirect userLibInstance
            }
            '*'{ respond userLibInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UserLib userLibInstance) {

        if (userLibInstance == null) {
            notFound()
            return
        }

        userLibInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserLib.label', default: 'UserLib'), userLibInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userLib.label', default: 'UserLib'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
