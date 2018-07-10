package com.bds.milkana.utils;

import java.io.*;
import java.util.UUID;


public class FileWriteUtils {
    //测试本地使用
//    public static String basePath = "D:\\img\\";
//    public static String baseUrl = "http://localhost:8080/";

    public static String basePath = "D:\\java\\milkana\\upload\\";
    public static String baseUrl = "http://211.152.47.91:8050/";
    public static String baseUrlEZong = "/download/";


    public static String wirteImg(byte[] bytes) {
        String url = "";
        try {
            String fileName = basePath + UUID.randomUUID().toString() + ".png";
            FileOutputStream fileOutputStream = new FileOutputStream(fileName);
            fileOutputStream.write(bytes);
            fileOutputStream.close();
            url = fileName;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return url;
    }

    /**
     * 解决summernote onImageUpload 必须返回url格式的问题
     * tomcat server.xml中Host中加
     * <Context path="" docBase="D://img" debug="0" reloadable="false"/>
     * @param fileName
     * @param bytes
     * @return
     */
    public static String wirteImg(String fileName,  byte[] bytes) {
        String url = "";
        try {
            String path = basePath+fileName;
            url = baseUrl+fileName;
            FileOutputStream fileOutputStream = new FileOutputStream(path);
            fileOutputStream.write(bytes);
            fileOutputStream.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return url;
    }

    public static void wirteFile(String path, String value) {
        File file = new File(path);
        FileWriter fw = null;
        BufferedWriter writer = null;
        try {
            fw = new FileWriter(file);
            writer = new BufferedWriter(fw);
            writer.write(value);
            writer.flush();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                writer.close();
                fw.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


    public static String readFile(String path) throws IOException {
        File file = new File(path);
        if (!file.exists() || file.isDirectory())
            throw new FileNotFoundException();
        FileInputStream fis = new FileInputStream(file);
        byte[] buf = new byte[1024];
        StringBuffer sb = new StringBuffer();
        while ((fis.read(buf)) != -1) {
            sb.append(new String(buf));
            buf = new byte[1024];
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        byte[] bs = new byte[]{1, 2, 3, 4, 5};
        wirteImg(bs);
    }
}
