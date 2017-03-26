package com.meebid.front.service;

import com.meebid.front.dao.CommonDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by gaoyang on 17/2/19.
 */
@Service("commonService")
public class CommonService {
    @Autowired
    CommonDao commonDao;

    public void test(){
        commonDao.test();
    }

    public void saveString(String k, String v){
        commonDao.saveString(k,v);
    }

    public void saveObject(String k,Object o){
        commonDao.saveObject(k,o);
    }

    public String getString(String k){
        return commonDao.getString(k);
    }

    public Object getObject(String k ,Object entity){
        return commonDao.getObject(k,entity);
    }

    public void delete(String k){
        commonDao.delete(k);
    }
}
