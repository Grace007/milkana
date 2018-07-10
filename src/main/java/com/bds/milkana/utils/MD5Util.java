package com.bds.milkana.utils;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;


public class MD5Util {
    public static String MD5(String str) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(str.getBytes(StandardCharsets.UTF_8)); // "GBK"问题主要出在这里，Java的字符串是unicode编码，不受源码文件的编码影响；而PHP的编码是和源码文件的编码一致，受源码编码影响。
            StringBuffer buf = new StringBuffer();
            for (byte b : md.digest()) {
                buf.append(String.format("%02x", b & 0xff));
            }
            return buf.toString();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String MD(String s) {
        if ("".equals(s) || null == s || "".equals(s.trim())) {
            return null;
        }

        char hexDigits[] = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F'};
        try {
            byte[] btInput = s.getBytes();
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            mdInst.update(btInput);
            byte[] md = mdInst.digest();
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            return null;
        }
    }

    public static String getHashCode(Object object) throws IOException {
        if (object == null)
            return "";

        String ss = null;
        ObjectOutputStream s = null;
        ByteArrayOutputStream bo = new ByteArrayOutputStream();
        try {
            s = new ObjectOutputStream(bo);
            s.writeObject(object);
            s.flush();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (s != null) {
                s.close();
                s = null;
            }
        }
        ss = MD5(bo.toString());
        return ss;
    }

    public static void main(String[] args) {
        System.out.println(MD5("123456"));
    }
}
