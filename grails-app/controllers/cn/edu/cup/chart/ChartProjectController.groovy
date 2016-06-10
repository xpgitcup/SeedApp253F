package cn.edu.cup.chart



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ChartProjectController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ChartProject.list(params), model:[chartProjectInstanceCount: ChartProject.count()]
    }

    def show(ChartProject chartProjectInstance) {
        respond chartProjectInstance
    }

    def create() {
        respond new ChartProject(params)
    }

    @Transactional
    def save(ChartProject chartProjectInstance) {
        if (chartProjectInstance == null) {
            notFound()
            return
        }

        if (chartProjectInstance.hasErrors()) {
            respond chartProjectInstance.errors, view:'create'
            return
        }

        chartProjectInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'chartProject.label', default: 'ChartProject'), chartProjectInstance.id])
                redirect chartProjectInstance
            }
            '*' { respond chartProjectInstance, [status: CREATED] }
        }
    }

    def edit(ChartProject chartProjectInstance) {
        respond chartProjectInstance
    }

    @Transactional
    def update(ChartProject chartProjectInstance) {
        if (chartProjectInstance == null) {
            notFound()
            return
        }

        if (chartProjectInstance.hasErrors()) {
            respond chartProjectInstance.errors, view:'edit'
            return
        }

        chartProjectInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ChartProject.label', default: 'ChartProject'), chartProjectInstance.id])
                redirect chartProjectInstance
            }
            '*'{ respond chartProjectInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ChartProject chartProjectInstance) {

        if (chartProjectInstance == null) {
            notFound()
            return
        }

        chartProjectInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ChartProject.label', default: 'ChartProject'), chartProjectInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'chartProject.label', default: 'ChartProject'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
