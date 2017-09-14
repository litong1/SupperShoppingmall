package com.ll.core.utils;

import java.util.ArrayList;
import java.util.List;

import com.ll.mall.vo.Cart;

/**
 * 字符串工具类
 * @author litong
 *
 */
public class StringUtil {

	public static String listToString(List<String> array){
		String rs= "";
		for (String string : array) {
			rs = rs + string + " ";
		}
		return rs;		
	}
	
	public static List<String> stringToList(String str){
		List<String> list = new ArrayList<>();
		String[] s = str.split(" ");
		for (String string : s) {
			list.add(string);
		}
		return list;
	}
	public static List<String> arrayToList(String[] str){
		List<String> list = new ArrayList<>();
		
		for (String string : str) {
			list.add(string);
		}
		return list;
	}
	public static void main(String[] args) {
		List<String> list = stringToList("C:/Users/litong/WebLT/SuperShoppingmall/WebContent/images/upload\726026.jpg C:/Users/litong/WebLT/SuperShoppingmall/WebContent/images/upload\726027.jpg C:/Users/litong/WebLT/SuperShoppingmall/WebContent/images/upload\726028.jpg C:/Users/litong/WebLT/SuperShoppingmall/WebContent/images/upload\726029.jpg C:/Users/litong/WebLT/SuperShoppingmall/WebContent/images/upload\726030.jpg ");
		for (String string : list) {
			System.out.println(string);
		}
	}
	
}
