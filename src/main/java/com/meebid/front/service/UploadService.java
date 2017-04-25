package com.meebid.front.service;

import com.google.gson.Gson;
import com.meebid.front.dao.CommonDao;
import com.meebid.front.utils.QiNiuYunUtil;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by gaoyang on 17/2/19.
 */
@Service("uploadService")
public class UploadService {
    Zone z = Zone.autoZone();
    Configuration c = new Configuration(z);
    //创建上传对象
    UploadManager uploadManager = new UploadManager(c);

    public String qiniuyunupload(byte[] file) throws Exception {
        Response response = uploadManager.put(file, null, QiNiuYunUtil.getInstance().getUpToken());
        //解析上传成功的结果
        DefaultPutRet putRet = new Gson().fromJson(response.bodyString(), DefaultPutRet.class);
//        System.out.println(putRet.key);
//        System.out.println(putRet.hash);
        return putRet.hash;
    }

}
