package com.meebid.front.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class SettingUtil {
	private static String path = "/setting.properties";


	public static String getSetting(String name) {
		Properties p = new Properties();
		String result="";
		try {
			InputStream in = SettingUtil.class.getResourceAsStream(path);
			 p.load(in);  
			 in.close();  
			 if(p.containsKey(name)){
				 result=String.valueOf(p.get(name));
			 }
		} catch (IOException ex) {
			
		}
		return result;  
	}
	
	public static void main(String[] args) {

		String aa="1-3.jps";

		System.out.println(aa.substring(0,aa.indexOf(".")));
	}
}