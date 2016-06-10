package cn.edu.cup.chart



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ChartTopicController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond ChartTopic.list(params), model:[chartTopicInstanceCount: ChartTopic.count()]
    }

    def show(ChartTopic chartTopicInstance) {
        respond chartTopicInstance
    }

    def create() {
        respond new ChartTopic(params)
    }

    @Transactional
    def save(ChartTopic chartTopicInstance) {
        if (chartTopicInstance == null) {
            notFound()
            return
        }

        if (chartTopicInstance.hasErrors()) {
            respond chartTopicInstance.errors, view:'create'
            return
        }

        chartTopicInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'chartTopic.label', default: 'ChartTopic'), chartTopicInstance.id])
                redirect chartTopicInstance
            }
            '*' { respond chartTopicInstance, [status: CREATED] }
        }
    }

    def edit(ChartTopic chartTopicInstance) {
        respond chartTopicInstance
    }

    @Transactional
    def update(ChartTopic chartTopicInstance) {
        if (chartTopicInstance == null) {
            notFound()
            return
        }

        if (chartTopicInstance.hasErrors()) {
            respond chartTopicInstance.errors, view:'edit'
            return
        }

        chartTopicInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'ChartTopic.label', default: 'ChartTopic'), chartTopicInstance.id])
                redirect chartTopicInstance
            }
            '*'{ respond chartTopicInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(ChartTopic chartTopicInstance) {

        if (chartTopicInstance == null) {
            notFound()
            return
        }

        chartTopicInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'ChartTopic.label', default: 'ChartTopic'), chartTopicInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'chartTopic.label', default: 'ChartTopic'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
