package me.ajan.mybatis.page;

/**
 * Created by ajan on 2016/8/1.
 */
public enum DBDialectType {
    MYSQL("mysql", "me.ajan.mybatis.page.pagesql.impl.MySQLPageSqlImpl"),
    ORACLE("oracle", "me.ajan.mybatis.page.pagesql.impl.OraclePageSqlImpl");

    DBDialectType(String name, String pageSqlImplClass) {
        this.name = name;
        this.pageSqlImplClass = pageSqlImplClass;
    }

    private String name;
    private String pageSqlImplClass;

    public String getName() {
        return name;
    }

    public String getPageSqlImplClass() {
        return pageSqlImplClass;
    }
}
