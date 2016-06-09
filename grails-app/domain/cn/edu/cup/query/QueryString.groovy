package cn.edu.cup.query

class QueryString {

    String sqlString
    String comment

    static belongsTo = [clazz: DomainQuery]

    static constraints = {
    }

    String toString() {
        return "${sqlString}"
    }
}
