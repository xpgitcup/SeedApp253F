package cn.edu.cup.query



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class QueryStringController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond QueryString.list(params), model:[queryStringInstanceCount: QueryString.count()]
    }

    def show(QueryString queryStringInstance) {
        respond queryStringInstance
    }

    def create() {
        respond new QueryString(params)
    }

    @Transactional
    def save(QueryString queryStringInstance) {
        if (queryStringInstance == null) {
            notFound()
            return
        }

        if (queryStringInstance.hasErrors()) {
            respond queryStringInstance.errors, view:'create'
            return
        }

        queryStringInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'queryString.label', default: 'QueryString'), queryStringInstance.id])
                redirect queryStringInstance
            }
            '*' { respond queryStringInstance, [status: CREATED] }
        }
    }

    def edit(QueryString queryStringInstance) {
        respond queryStringInstance
    }

    @Transactional
    def update(QueryString queryStringInstance) {
        if (queryStringInstance == null) {
            notFound()
            return
        }

        if (queryStringInstance.hasErrors()) {
            respond queryStringInstance.errors, view:'edit'
            return
        }

        queryStringInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'QueryString.label', default: 'QueryString'), queryStringInstance.id])
                redirect queryStringInstance
            }
            '*'{ respond queryStringInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(QueryString queryStringInstance) {

        if (queryStringInstance == null) {
            notFound()
            return
        }

        queryStringInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'QueryString.label', default: 'QueryString'), queryStringInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'queryString.label', default: 'QueryString'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
