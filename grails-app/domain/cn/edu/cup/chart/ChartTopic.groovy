package cn.edu.cup.chart

class ChartTopic {

    String topicContext
    String topicAuthor
    String sayTo
    Date startAt
    ChartTopic upTopic

    static belongsTo = [chartProject: ChartProject]

    static hasMany = [subTopic: ChartTopic]

    static constraints = {
        sayTo()
        topicContext()
        topicAuthor()
        startAt()
        upTopic(nullable: true)
    }

    String toString() {
        return "${topicContext}"
    }
}
