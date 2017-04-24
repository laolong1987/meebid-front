package com.meebid.front.utils;

import com.qiniu.util.Auth;

import java.util.Date;

/**
 * Created by gaoyang on 2017/4/24.
 */
public class QiNiuYunUtil {
    private volatile static QiNiuYunUtil uniqueInstance;

    private String ACCESS_KEY;
    private String SECRET_KEY;
    private String bucketname = "saci";
    private long createtime=0;
    private String token;

    private QiNiuYunUtil(){
        ACCESS_KEY = SettingUtil.getSetting("ACCESS_KEY");
        SECRET_KEY = SettingUtil.getSetting("SECRET_KEY");
        createtime= new Date().getTime()/1000;
    }

    public static QiNiuYunUtil getInstance(){
        if(uniqueInstance==null){
            synchronized (QiNiuYunUtil.class) {
                if(uniqueInstance==null){
                    uniqueInstance =new QiNiuYunUtil();
                    uniqueInstance.generateToken();
                }
            }
        }
        return uniqueInstance;
    }

    public String getUpToken() {
        Date date = new Date();
        long now= date.getTime()/1000;
        if(now-createtime>3000){
            this.generateToken();
        }
        return token;
    }

    private void generateToken(){
        createtime= new Date().getTime()/1000;
        Auth auth = Auth.create(ACCESS_KEY, SECRET_KEY);
        token = auth.uploadToken(bucketname);
    }

    public static void main(String[] args){
        String t = QiNiuYunUtil.getInstance().getUpToken();
        System.out.println(t);
    }
}
