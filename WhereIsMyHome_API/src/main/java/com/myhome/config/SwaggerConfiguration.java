package com.myhome.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

//import io.swagger.v3.oas.annotations.info.Info;
import io.swagger.v3.oas.models.Components;
import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import io.swagger.v3.oas.models.security.OAuthFlow;
import io.swagger.v3.oas.models.security.OAuthFlows;
import io.swagger.v3.oas.models.security.Scopes;
import io.swagger.v3.oas.models.security.SecurityRequirement;
import io.swagger.v3.oas.models.security.SecurityScheme;

//Swagger-UI 확인
//http://localhost/swagger-ui.html

@Configuration // 스프링 설정 클래스임을 나타냅니다.
public class SwaggerConfiguration {
	@Bean
    public OpenAPI customOpenAPI() {
        return new OpenAPI()
        		.info(apiInfo())
                .addSecurityItem(new SecurityRequirement().addList("kakaoAuth"))
                .components(new Components() // API 구성 요소를 설정합니다.
                		
                        .addSecuritySchemes("kakaoAuth", new SecurityScheme()
                                .type(SecurityScheme.Type.OAUTH2)
                                .flows(new OAuthFlows()
                                        .authorizationCode(new OAuthFlow()
                                                .authorizationUrl("https://kauth.kakao.com/oauth/authorize")
                                                .tokenUrl("https://kauth.kakao.com/oauth/token")
                                                .scopes(new Scopes().addString("profile_nickname", "Access your nickname")
                                                                   .addString("profile_image", "Access your profile image")
                                                                   .addString("account_email", "Access your email"))
                                        )
                                )
                        )
                );
    }


	private Info apiInfo() {
		return new Info().title("Homescanner 문서 API") // API 제목을 설정합니다.
				.description("<h3>RestAPI 문서 내용을 다음과 같이 제공합니다.</h3>") // API 설명을 설정합니다.
				.version("1.6.0"); // API 버전을 설정합니다.
	}
}