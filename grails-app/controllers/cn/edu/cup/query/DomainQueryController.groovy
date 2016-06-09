package cn.edu.cup.query



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class DomainQueryController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond DomainQuery.list(params), model:[domainQueryInstanceCount: DomainQuery.count()]
    }

    def show(DomainQuery domainQueryInstance) {
        respond domainQueryInstance
    }

    def create() {
        respond new DomainQuery(params)
    }

    @Transactional
    def save(DomainQuery domainQueryInstance) {
        if (domainQueryInstance == null) {
            notFound()
            return
        }

        if (domainQueryInstance.hasErrors()) {
            respond domainQueryInstance.errors, view:'create'
            return
        }

        domainQueryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'domainQuery.label', default: 'DomainQuery'), domainQueryInstance.id])
                redirect domainQueryInstance
            }
            '*' { respond domainQueryInstance, [status: CREATED] }
        }
    }

    def edit(DomainQuery domainQueryInstance) {
        respond domainQueryInstance
    }

    @Transactional
    def update(DomainQuery domainQueryInstance) {
        if (domainQueryInstance == null) {
            notFound()
            return
        }

        if (domainQueryInstance.hasErrors()) {
            respond domainQueryInstance.errors, view:'edit'
            return
        }

        domainQueryInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'DomainQuery.label', default: 'DomainQuery'), domainQueryInstance.id])
                redirect domainQueryInstance
            }
            '*'{ respond domainQueryInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(DomainQuery domainQueryInstance) {

        if (domainQueryInstance == null) {
            notFound()
            return
        }

        domainQueryInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'DomainQuery.label', default: 'DomainQuery'), domainQueryInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'domainQuery.label', default: 'DomainQuery'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
