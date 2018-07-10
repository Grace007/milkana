package com.bds.milkana.config;

import com.alibaba.druid.pool.DruidDataSourceFactory;
import com.alibaba.druid.support.http.StatViewServlet;
import com.alibaba.druid.support.http.WebStatFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;

import javax.sql.DataSource;
import java.util.Properties;



@Configuration
public class DruidDataSourceConfig {
    @Autowired
    Environment environment;

    @Bean
    public DataSource druidDataSource() throws Exception {
        Properties properties = new Properties();
        properties.put("url", environment.getProperty("spring.datasource.url"));
        properties.put("username", environment.getProperty("spring.datasource.username"));
        properties.put("password", environment.getProperty("spring.datasource.password"));
        properties.put("driver", environment.getProperty("spring.datasource.driver-class-name"));
        properties.put("type", environment.getProperty("spring.datasource.type"));
        //properties.put("platform", environment.getProperty("spring.datasource.platform"));
//        properties.put("initial-size", environment.getProperty("spring.datasource.tomcat.initial-size"));
//        properties.put("max-active", environment.getProperty("spring.datasource.tomcat.max-active"));
//        properties.put("initialPoolSize", environment.getProperty("spring.datasource.initialPoolSize"));
//        properties.put("minPoolSize", environment.getProperty("spring.datasource.minPoolSize"));
//        properties.put("maxPoolSize", environment.getProperty("spring.datasource.maxPoolSize"));
//        properties.put("maxStatements", environment.getProperty("spring.datasource.maxStatements"));
//        properties.put("maxIdleTime", environment.getProperty("spring.datasource.maxIdleTime"));
//        properties.put("acquireIncrement", environment.getProperty("spring.datasource.acquireIncrement"));
//        properties.put("acquireRetryAttempts", environment.getProperty("spring.datasource.acquireRetryAttempts"));
//        properties.put("acquireRetryDelay", environment.getProperty("spring.datasource.acquireRetryDelay"));
//        properties.put("testConnectionOnCheckin", environment.getProperty("spring.datasource.testConnectionOnCheckin"));
//        properties.put("idleConnectionTestPeriod", environment.getProperty("spring.datasource.idleConnectionTestPeriod"));
//        properties.put("checkoutTimeout", environment.getProperty("spring.datasource.checkoutTimeout"));
//        properties.put("filters", environment.getProperty("spring.datasource.filters"));
        return DruidDataSourceFactory.createDataSource(properties);
    }

    @Bean
    public ServletRegistrationBean druidServletRegistrationBean() {
        ServletRegistrationBean servletRegistrationBean = new ServletRegistrationBean(new StatViewServlet(), "/druid/*");
        return servletRegistrationBean;
    }

    @Bean
    public FilterRegistrationBean filterRegistrationBean(ServletRegistrationBean druidServletRegistrationBean) {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean(new WebStatFilter(), druidServletRegistrationBean);
        filterRegistrationBean.addUrlPatterns("/*");
        filterRegistrationBean.addInitParameter("exclusions", "*.js,*.gif,*.jpg,*.png,*.css,*.ico,/druid/*");
        return filterRegistrationBean;

    }
}
