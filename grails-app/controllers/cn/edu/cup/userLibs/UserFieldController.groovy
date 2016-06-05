package cn.edu.cup.userLibs



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class UserFieldController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond UserField.list(params), model:[userFieldInstanceCount: UserField.count()]
    }

    def show(UserField userFieldInstance) {
        respond userFieldInstance
    }

    def create() {
        respond new UserField(params)
    }

    @Transactional
    def save(UserField userFieldInstance) {
        if (userFieldInstance == null) {
            notFound()
            return
        }

        if (userFieldInstance.hasErrors()) {
            respond userFieldInstance.errors, view:'create'
            return
        }

        userFieldInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'userField.label', default: 'UserField'), userFieldInstance.id])
                redirect userFieldInstance
            }
            '*' { respond userFieldInstance, [status: CREATED] }
        }
    }

    def edit(UserField userFieldInstance) {
        respond userFieldInstance
    }

    @Transactional
    def update(UserField userFieldInstance) {
        if (userFieldInstance == null) {
            notFound()
            return
        }

        if (userFieldInstance.hasErrors()) {
            respond userFieldInstance.errors, view:'edit'
            return
        }

        userFieldInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'UserField.label', default: 'UserField'), userFieldInstance.id])
                redirect userFieldInstance
            }
            '*'{ respond userFieldInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(UserField userFieldInstance) {

        if (userFieldInstance == null) {
            notFound()
            return
        }

        userFieldInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'UserField.label', default: 'UserField'), userFieldInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'userField.label', default: 'UserField'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
