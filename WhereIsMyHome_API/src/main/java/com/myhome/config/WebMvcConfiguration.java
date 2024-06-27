package com.myhome.config;

import java.util.Arrays;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpMethod;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.resource.PathResourceResolver;

import com.myhome.interceptor.ConfirmInterceptor;
import com.myhome.interceptor.JWTInterceptor;

//import lombok.extern.slf4j.Slf4j;

//@Slf4j
@Configuration
@EnableWebMvc
@EnableAspectJAutoProxy
@MapperScan(basePackages = { "com.myhome.**.mapper" })
public class WebMvcConfiguration implements WebMvcConfigurer {
	
	private final List<String> interceptorPatterns = Arrays.asList("//*", "/admin", "/user/list");
	private final JWTInterceptor jwtInterceptor;
	private final ConfirmInterceptor confirmInterceptor;
	private final String uploadFilePath;

	@Autowired
	public WebMvcConfiguration(@Value("${file.path.upload-files}") String uploadFilePath, JWTInterceptor jwtInterceptor, ConfirmInterceptor confirmInterceptor) {
		this.uploadFilePath = uploadFilePath;
		this.jwtInterceptor = jwtInterceptor;
		this.confirmInterceptor = confirmInterceptor;
	}

	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**")
			.allowedOrigins("*")
			.allowedOrigins("http://localhost:8080", "http://localhost:8081")
				.allowedMethods(HttpMethod.GET.name(), HttpMethod.POST.name(), HttpMethod.PUT.name(),
						HttpMethod.DELETE.name(), HttpMethod.HEAD.name(), HttpMethod.OPTIONS.name(),
						HttpMethod.PATCH.name())
				.allowedHeaders("*")
				.exposedHeaders("Authorization")
				.maxAge(3600); // 3600초 동안 preflight 결과를 캐시에 저장

	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(confirmInterceptor).addPathPatterns(interceptorPatterns);
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/upload/file/**").addResourceLocations("file:///" + uploadFilePath + "/")
				.setCachePeriod(3600).resourceChain(true).addResolver(new PathResourceResolver());
	}

	@Override
	public void addViewControllers(ViewControllerRegistry registry) {
		registry.addViewController("/").setViewName("index");
	}
	
}
