package cn.edu.cup.chart

class ChartProject {

    String projectName
    String projectAuthor
    Date   startAt

    static hasMany = [chartTopic: ChartTopic]

    static mapping = {
    }

    static constraints = {
        projectName(unique: true)
        projectAuthor()
        startAt()
    }

    String toString() {
        return "${projectName}.${projectAuthor}"
    }
}
