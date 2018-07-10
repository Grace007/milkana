package com.bds.milkana;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.web.servlet.ErrorPage;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;

/**
 * springboot启动类
 */
@SpringBootApplication
public class App {
	public static void main(String[] args) {

		SpringApplication.run(App.class);
	}

	@Bean
	public EmbeddedServletContainerCustomizer containerCustomizer() {

		return new EmbeddedServletContainerCustomizer() {
			@Override
			public void customize(ConfigurableEmbeddedServletContainer container) {

				ErrorPage error401Page = new ErrorPage(HttpStatus.UNAUTHORIZED, "/page/page404.html");
				ErrorPage error404Page = new ErrorPage(HttpStatus.NOT_FOUND, "/page/page404.html");
				ErrorPage error500Page = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/page/page500.html");

				container.addErrorPages(error401Page, error404Page, error500Page);
			}
		};
	}
}

/**
 * Hello world!
 */
// 解决打包成jar之后，jar路径解析出的问题（），方法是达成war包，并修改相关启动类
/*
 * @SpringBootApplication public class App extends SpringBootServletInitializer
 * {
 * 
 * @Override protected SpringApplicationBuilder
 * configure(SpringApplicationBuilder builder) { return
 * builder.sources(App.class); } public static void main(String[] args) {
 * SpringApplication.run(App.class); }
 * 
 * @Bean public EmbeddedServletContainerCustomizer containerCustomizer() {
 * 
 * return new EmbeddedServletContainerCustomizer() {
 * 
 * @Override public void customize(ConfigurableEmbeddedServletContainer
 * container) {
 * 
 * ErrorPage error401Page = new ErrorPage(HttpStatus.UNAUTHORIZED,
 * "/page/page404.html"); ErrorPage error404Page = new
 * ErrorPage(HttpStatus.NOT_FOUND, "/page/page404.html"); ErrorPage error500Page
 * = new ErrorPage(HttpStatus.INTERNAL_SERVER_ERROR, "/page/page500.html");
 * 
 * container.addErrorPages(error401Page, error404Page, error500Page); } }; }
 * 
 * }
 */
