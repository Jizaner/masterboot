package com.jizan.utils;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Random;

public class SmsCode {

	/**
	 * 获取6位随机验证码
	 * 
	 * @return
	 * 
	 */
	public static String smsCode() {
		Random r = new Random();
		String code = "";
		for (int i = 0; i < 6; i++) {
			code += r.nextInt(10);
		}
		return code;
	}
	
	public static int sendSMS(String Mobile,String Code,String sendTime) throws MalformedURLException, UnsupportedEncodingException {
		URL url = null;
//		String CorpID="YXS02943";//账户名
//		String Pwd="888888";//密码
//		String content = "您的验证码为："+Code+"，5分钟内有效。";
//		String sendContent=URLEncoder.encode(content.replaceAll("<br/>", " "), "GBK");//发送内容
//		url = new URL("http://www.106551.com:81/ws/BatchSend.aspx?CorpID="+CorpID+"&Pwd="+Pwd+"&Mobile="+Mobile+"&Content="+sendContent+"&Cell=&SendTime="+sendTime);
//		
		String CorpID="YX03310";//账户名
		String Pwd="105566";//密码
		String content = "恭喜您获得元京东电子劵。";
		String send_content=URLEncoder.encode(content.replaceAll("<br/>", " "), "GBK");//发送内容
		long send_time = System.currentTimeMillis()/1000;
		url = new URL("http://www.106551.com:81/ws/BatchSend.aspx?CorpID="+CorpID+"&Pwd="+Pwd+"&Mobile="+Mobile+"&Content="+send_content+"&Cell=&SendTime="+send_time );
		
		BufferedReader in = null; 
		int inputLine = 0;
		try {
//			System.out.println("开始发送短信手机号码为 ："+Mobile);
			in = new BufferedReader(new InputStreamReader(url.openStream()));
			inputLine = new Integer(in.readLine()).intValue();
			in.close();
		} catch (Exception e) {
//			System.out.println("网络异常,发送短信失败！");
			inputLine=-2;
		}
		
		//System.out.println("结束发送短信返回值：  "+inputLine);
		return inputLine;
	}
	
/*	public static void main(String[] args) {
		try {
			sendSMS("17710919923","2222","bbb");
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		System.out.println(smsCode());
	}*/

	public static void sendSMS(long mobile, String code, String sendTime) {
		// TODO Auto-generated method stub
		
	}
}
