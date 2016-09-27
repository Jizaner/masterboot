package com.jizan.vendors.qiniu;

import java.util.Random;

import com.jizan.vendors.qiniu.QiniuBase;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.UploadManager;
import com.qiniu.util.Auth;

/**
 * 七牛 java sdk 简单上传
 * @author xuhuanchao
 */
public class QiniuUpload {

    Auth auth = Auth.create(QiniuBase.ACCESS_KEY, QiniuBase.SECRET_KEY);
    UploadManager uploadManager = new UploadManager();

    /**
     * 获取凭证
     * @param bucketName 空间名称
     * @return
     */
    public String getUpToken(String bucketName) {
        return auth.uploadToken(bucketName);
    }

    /**
     * 第一种方式上传：字节
     * @param filePath 文件路径  （也可以是字节数组、或者File对象）
     * @param key 上传到七牛上的文件的名称  （同一个空间下，名称【key】是唯一的）
     * @param bucketName 空间名称  （这里是为了获取上传凭证）
     */
    public void upload(byte[] file, String key, String bucketName) {
        try {
            // 调用put方法上传
            Response res = uploadManager.put(file, key, getUpToken(bucketName));
            // 打印返回的信息
            System.out.println(res.bodyString());
        } catch (QiniuException e) {
            Response r = e.response;
            // 请求失败时打印的异常的信息
            System.out.println(r.toString());
            try {
                // 响应的文本信息
                System.out.println(r.bodyString());
            } catch (QiniuException qe) {
                // ignore
            }
        }
    }

    /**
     * 第二种方式上传:通过路径
     * @param filePath 文件路径  （也可以是字节数组、或者File对象）
     * @param key 上传到七牛上的文件的名称  （同一个空间下，名称【key】是唯一的）
     * @param bucketName 空间名称  （这里是为了获取上传凭证）
     */
    public void uploadFile(String filePath, String key, String bucketName) {
        try {
            // 调用put方法上传
            Response res = uploadManager.put(filePath, key, getUpToken(bucketName));
            // 打印返回的信息
            System.out.println(res.bodyString());
        } catch (QiniuException e) {
            Response r = e.response;
            // 请求失败时打印的异常的信息
            System.out.println(r.toString());
            try {
                // 响应的文本信息
                System.out.println(r.bodyString());
            } catch (QiniuException qe) {
                // ignore
            }
        }
    }
    /**
     * 主函数：程序入口，测试功能
     * @param args
     */
/*    public static void main(String[] args) {
        // 上传文件的路径，因为在Mac下，所以路径和windows下不同
        String filePath = "C:/bg.jpg";
        // 要上传的空间
        String bucketName = "ommasters";
        // 上传到七牛后保存的文件名
        String key = "topicname_"+System.currentTimeMillis() + new Random(50000).nextInt();

        new QiniuUpload().uploadFile(filePath, key, bucketName);
    }*/
}