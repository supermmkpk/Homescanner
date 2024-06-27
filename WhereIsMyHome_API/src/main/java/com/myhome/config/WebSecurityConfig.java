package com.myhome.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig {
	
//	@Bean
//    public WebSecurityCustomizer webSecurityCustomizer(){
//        return web -> {
//            web.ignoring()
//                    .requestMatchers(
//                    		"/**"
//                    );
//        };
//    }

	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
		http
			.csrf().disable()
			.authorizeRequests(
				authorizeRequests -> 
					authorizeRequests
						.requestMatchers( "/**").permitAll()
						.anyRequest().authenticated()
				)
				.oauth2Login(oauth2Login -> 
					oauth2Login
						.loginPage("/login")
						.defaultSuccessUrl("/loginSuccess")
						.failureUrl("/loginFailure")
				);
		return http.build();
	}
}
