package com.meebid.front.bean;

import java.util.List;

/**
 * Created by gaoyang on 2017/4/7.
 */
public class SearchTemplate<T> {

    Integer totalCount;

    List<T> dateList;

    public List<T> getDateList() {
        return dateList;
    }

    public void setDateList(List<T> dateList) {
        this.dateList = dateList;
    }

    public Integer getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(Integer totalCount) {
        this.totalCount = totalCount;
    }
}
