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
        //判断当前page 是否有前10页和后10页

        int pagetotal=total/pageSize+1;

        int beginpage=0;
        int endpage=0;

        if(pagetotal<=10){
            beginpage=1;
            endpage=total;
        }else if(page-4<=0){
            beginpage=1;
            endpage=10;
        }else if(page+5 > pagetotal){
            beginpage=pagetotal-10;
            endpage=pagetotal;
        }
        else if(page-4>0 && page+5 <=pagetotal){
            beginpage=page-4;
            endpage=page+5;
        }

        map.put("beginpage",beginpage);
        map.put("endpage",endpage);

        return map;
    }
}
