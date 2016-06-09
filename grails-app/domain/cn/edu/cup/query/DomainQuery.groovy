package cn.edu.cup.query

class DomainQuery {

    String clazzName

    static hasMany = [sqlString: QueryString]

    static constraints = {
    }

    String toString() {
        return "${clazzName}"
    }

}
