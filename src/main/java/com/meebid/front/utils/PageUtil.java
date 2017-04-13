package com.meebid.front.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by gaoyang on 17/4/13.
 */
public class PageUtil {
    public static Map getPage(int page,int pageSize,int total){
        Map<String,Integer> map=new HashMap();
        map.put("page",page);
        map.put("pageSize",pageSize);
        map.put("total",total);
        map.put("pagetotal",total/pageSize+1);
        return map;
    }
}
