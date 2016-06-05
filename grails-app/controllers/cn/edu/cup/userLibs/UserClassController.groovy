package cn.edu.cup.userLibs



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserClassController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UserClass.list(params), model:[userClassInstanceCount: UserClass.count()]
    }

    def show(UserClass userClassInstance) {
        respond userClassInstance
    }

    def create() {
        respond new UserClass(params)
    }

    @Transactional
    def save(UserClass userClassInstance) {
        if (userClassInstance == null) {
            notFound()
            return
        }

        if (userClassInstance.hasErrors()) {
            respond userClassInstance.errors, view:'create'
            return
        }

        userClassInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userClass.label', default: 'UserClass'), userClassInstance.id])
                redirect userClassInstance
            }
            '*' { respond userClassInstance, [status: CREATED] }
        }
    }

    def edit(UserClass userClassInstance) {
        respond userClassInstance
    }

    @Transactional
    def update(UserClass userClassInstance) {
        if (userClassInstance == null) {
            notFound()
            return
        }

        if (userClassInstance.hasErrors()) {
            respond userClassInstance.errors, view:'edit'
            return
        }

        userClassInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UserClass.label', default: 'UserClass'), userClassInstance.id])
                redirect userClassInstance
            }
            '*'{ respond userClassInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UserClass userClassInstance) {

        if (userClassInstance == null) {
            notFound()
            return
        }

        userClassInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserClass.label', default: 'UserClass'), userClassInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userClass.label', default: 'UserClass'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
