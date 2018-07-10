package com.bds.milkana.config;

import com.bds.milkana.filter.SessionInterceptor;
import org.nutz.dao.impl.NutDao;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.Set;


@Configuration
public class SessionConfig extends WebMvcConfigurerAdapter {
	@Resource
	private NutDao dao;
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
    	SessionInterceptor sessionInterceptor = new SessionInterceptor(dao);
        Set<String> writeUrls = new HashSet<>();
//        writeUrls.add("/page/login.html");
  
        writeUrls.add("/service/user/loginto");
        writeUrls.add("/service/user/signUp");

        sessionInterceptor.setWriteUrls(writeUrls);
        registry.addInterceptor(sessionInterceptor).addPathPatterns("/**");
        super.addInterceptors(registry);
    }
}
