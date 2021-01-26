package project.naveyosefcc.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import utils.MySimpleUrlAuthenticationSuccessHandler;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private DataSource securityDataSource;

    @Bean
    public AuthenticationSuccessHandler myAuthenticationSuccessHandler(){
        return new MySimpleUrlAuthenticationSuccessHandler();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
//        http.anonymous().and().authorizeRequests().anyRequest().authenticated().and().authorizeRequests()
//                .antMatchers("/controller/AppController**").permitAll();

        http.authorizeRequests()
                .antMatchers("/css/**", "/js/**", "/images/**","/reset_password**").permitAll();

        http.authorizeRequests()
                .antMatchers("/admin/**").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/student/**").access("hasRole('ROLE_STUDENT')")
                .antMatchers("/teacher/**").access("hasRole('ROLE_TEACHER')")
                .antMatchers("/common/**").access("hasRole('ROLE_ADMIN') or hasRole('ROLE_TEACHER') or hasRole('ROLE_STUDENT')")
                .anyRequest().authenticated().and()
                .formLogin().loginPage("/login_page").loginProcessingUrl("/auth_user")
                .permitAll()
                .and().formLogin().successHandler(myAuthenticationSuccessHandler())
                .and().logout().permitAll();

        http.csrf().disable();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.jdbcAuthentication().dataSource(securityDataSource);
    }

    public static String getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String toReturn = "";
        if (!(authentication instanceof AnonymousAuthenticationToken)) {
            toReturn = authentication.getName();
        }
        return toReturn;
    }

    @Bean
    public PasswordEncoder passwordEncoder(){
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }

}
