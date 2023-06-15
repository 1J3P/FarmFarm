package com.example.farmfarm.Config;

import com.example.farmfarm.Config.jwt.JwtRequestFilter;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
//@EnableWebSecurity
@RequiredArgsConstructor
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    private final CorsConfig corsConfig;
    private final JwtRequestFilter jwtRequestFilter;
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                .authorizeRequests() // 인증이 필요한 모든 요청에 대해
                .antMatchers("**/**").permitAll() // "/", "/hello" 는 인증정보 필요 없음.
                //.anyRequest().authenticated() // 그 외 모든 요청은 인증정보 필요함.
                .and()
                .formLogin() // formLogin 사용할 거임.
                .and()
                .addFilter(corsConfig.corsFilter())
                .addFilterBefore(jwtRequestFilter, UsernamePasswordAuthenticationFilter.class);
                //.httpBasic() // httpBasic 도 사용할 거임.

        http.csrf().disable();
    }
}