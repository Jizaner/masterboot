package com.jizan.utils;

import sun.misc.BASE64Encoder;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Security
 * <p>
 * <p>
 * GENGJUN
 * created on 2016/3/17
 */
public class Security {

    /**
     * base64 encode
     * @param bytes bytes to be encoded
     * @return the encoded String
     */
    public static String encodeUrlComponent(byte[] bytes){
        String enComponent = null;
        try{
            enComponent = new BASE64Encoder().encode(bytes);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return enComponent;
    }

    /**
     *
     * @param secretkey secret key
     * @param text to encrypt
     * @return the encrypted bytes
     */
    public static byte[] hmacSha1(String secretkey, String text){
        byte[] result = null;

        try {
            Mac mac = Mac.getInstance("HmacSHA1");
            Key key = new SecretKeySpec(secretkey.getBytes(), "HmacSHA1");
            mac.init(key);
            result = mac.doFinal(text.getBytes());
        } catch (NoSuchAlgorithmException | InvalidKeyException e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     *
     * @param text the string to encrypt
     * @return
     */
    public static String md5Encrypt(String text){
        if(text == null) return "";

        String result = null;
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("sha-1");
            byte[] eBytes = messageDigest.digest(text.getBytes());
            result = hex(eBytes);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        return result;
    }

    private static String hex(byte[] arr){
        if(arr == null){
            return "";
        }

        StringBuffer buffer = new StringBuffer();
        for(int i = 0; i < arr.length; i++){
            buffer.append(Integer.toHexString((arr[i] & 0xFF) | 0x100).substring(1, 3));
        }

        return buffer.toString();
    }
}