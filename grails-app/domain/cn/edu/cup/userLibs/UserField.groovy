package cn.edu.cup.userLibs

class UserField {

    String name

    static belongsTo = [clazz: UserClass]

    static constraints = {
    }

    String toString() {
        return "${clazz}.${name}"
    }

}
