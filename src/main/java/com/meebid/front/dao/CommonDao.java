package com.meebid.front.dao;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.meebid.front.bean.UserInfo;
import com.meebid.front.common.ObjectRedisTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Repository;
import redis.clients.jedis.Jedis;

import java.io.IOException;

/**
 * Created by gaoyang on 17/2/19.
 */
@Repository
public class CommonDao {

    @Autowired
    StringRedisTemplate stringRedisTemplate;


    public void test() {
        // String读写
//        stringRedisTemplate.delete("myStr");
//        stringRedisTemplate.opsForValue().set("myStr", "http://yjmyzz.cnblogs.com/");
//        System.out.println(stringRedisTemplate.opsForValue().get("myStr"));
//        System.out.println("---------------");

//        UserInfo userInfo=new UserInfo();
//        userInfo.setMobile("13737373333");
//        ObjectMapper mapper = new ObjectMapper();
//        try {
//            String json=mapper.writeValueAsString(userInfo); //将对象转换成json
//            stringRedisTemplate.opsForValue().set("userInfo",json);
//
//            UserInfo u=mapper.readValue(stringRedisTemplate.opsForValue().get("userInfo"), UserInfo.class);
//            System.out.println(u.getMobile());
//        } catch (JsonProcessingException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }

    }

    public void saveString(String k, String v) {
        stringRedisTemplate.opsForValue().set(k, v);
    }

    public void saveObject(String k,Object o){
        ObjectMapper mapper = new ObjectMapper();
        try {
            String json=mapper.writeValueAsString(o); //将对象转换成json
            stringRedisTemplate.opsForValue().set(k,json);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public String getString(String k) {
        return stringRedisTemplate.opsForValue().get(k);
    }

    public Object getObject(String k) {
        return stringRedisTemplate.opsForValue().get(k);
    }


    public void delete(String k){
        stringRedisTemplate.delete(k);
    }

}
