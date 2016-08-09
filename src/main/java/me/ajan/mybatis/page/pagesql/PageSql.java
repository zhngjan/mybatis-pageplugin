package me.ajan.mybatis.page.pagesql;

import me.ajan.mybatis.page.PageInfo;

/**
 * Created by ajan on 2016/8/1.
 */
public interface PageSql {
    public String getPageSql(String sql, PageInfo pageInfo);
}
