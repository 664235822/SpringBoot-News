package com;

import com.servlet.CheckServlet;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class SpringBootNewsApplication {

    public static void main(String[] args) {
        SpringApplication.run(SpringBootNewsApplication.class, args);
    }

    @Bean
    public ServletRegistrationBean CheckServlet(){
        return new ServletRegistrationBean(new CheckServlet(),"/servlet/*");
    }
}
