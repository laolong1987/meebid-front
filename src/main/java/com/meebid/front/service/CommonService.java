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

}
