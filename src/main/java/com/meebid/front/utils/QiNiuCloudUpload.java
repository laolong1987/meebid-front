package com.meebid.front.utils;

import com.fasterxml.jackson.databind.util.JSONPObject;
import com.qiniu.common.Zone;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

/**
 * Created by gaoyang on 2017/4/24.
 */
public class QiNiuCloudUpload {
    //设置好账号的ACCESS_KEY和SECRET_KEY
    String ACCESS_KEY = "cSeU29Y0oNjG4SDUS9sKKMKz8kINlB9mlVbaA6NJ";
    String SECRET_KEY = "wbfscriiZhFscdLpIdaDRIzFI0ilF5K";
    //要上传的空间
    String bucketname = "saci";
    //上传到七牛后保存的文件名
    String key = "my-java.png";
    //上传文件的路径
    String FilePath = "/.../...";

    //密钥配置
    Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);

    ///////////////////////指定上传的Zone的信息//////////////////
    //第一种方式: 指定具体的要上传的zone
    //注：该具体指定的方式和以下自动识别的方式选择其一即可
    //要上传的空间(bucket)的存储区域为华东时
    // Zone z = Zone.zone0();
    //要上传的空间(bucket)的存储区域为华北时
    // Zone z = Zone.zone1();
    //要上传的空间(bucket)的存储区域为华南时
    // Zone z = Zone.zone2();

    //第二种方式: 自动识别要上传的空间(bucket)的存储区域是华东、华北、华南。
    Zone z = Zone.autoZone();
    Configuration c = new Configuration(z);

    //创建上传对象
    UploadManager uploadManager = new UploadManager(c);



    //简单上传，使用默认策略，只需要设置上传的空间名就可以了
    public String getUpToken() {
        return auth.uploadToken(bucketname);
    }



    public JSONPObject upload(String fileName, byte[] file) throws Exception {
        Response res = uploadManager.put(file, fileName, QiNiuYunUtil.getInstance().getUpToken());
//        JSONPObject jsonObject = JSONPObject.fromObject(res.bodyString());
        return jsonObject;
    }
}
