package com.ll.core.utils;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
  
public class DateUtil {

	public static Date dateSwitch(java.util.Date date){
		long time = date.getTime();
		Date date_ = new Date(time);
		return date_;
		//11111ppp
	}
	public static java.util.Date stringToDate(String str){
		SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy-MM-dd" );
		try {
			return sdf.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	public static void main(String[] args) {
	    String str = "2014-07-09 10:48:23";
	    java.util.Date d;
	    try {
		d = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").parse(str);
		 System.out.println(d);
	    } catch (ParseException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	    }
	   
	}
}
