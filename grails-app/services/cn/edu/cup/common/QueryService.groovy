package cn.edu.cup.common

import cn.edu.cup.query.DomainQuery
import grails.transaction.Transactional

@Transactional
class QueryService {

    /*
    * 获取针对该类的所有查询字符串的列表
    * */
    def getAllQueryStrings(clazz) {
        def domainQuery = DomainQuery.findByClazzName(clazz.name)
        return domainQuery.sqlString
    }

    /*
    * 执行查询
    * */
    def executeQuery(clazz, sql) {
        return clazz.class.executeQuery(sql)
    }

}
