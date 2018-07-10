package com.bds.milkana.utils;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.protocol.HTTP;

import java.io.BufferedReader;
import java.net.URI;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 * @author eli
 * @date 2018/5/10 16:52
 */
public class HttpClientUtil {
    /**
     * post请求(用于key-value格式的参数)
     * @param url
     * @param params
     * @return
     */
    public static HttpResponse doPost(String url, Map params){

        BufferedReader in = null;
        try {
            // 定义HttpClient
            org.apache.http.client.HttpClient client = new DefaultHttpClient();
            // 实例化HTTP方法
            HttpPost request = new HttpPost();
            request.setURI(new URI(url));

            //设置参数
            List<NameValuePair> nvps = new ArrayList<NameValuePair>();
            for (Iterator iter = params.keySet().iterator(); iter.hasNext();) {
                String name = (String) iter.next();
                String value = String.valueOf(params.get(name));
                nvps.add(new BasicNameValuePair(name, value));

            }
            request.setEntity(new UrlEncodedFormEntity(nvps, HTTP.UTF_8));

            HttpResponse response = client.execute(request);
            int code = response.getStatusLine().getStatusCode();
            if(code == 200){    //请求成功
                return response;
            }
            else{   //
                System.out.println("状态码：" + code);
                return null;
            }
        }
        catch(Exception e){
            e.printStackTrace();

            return null;
        }
    }
}
