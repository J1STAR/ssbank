package com.ssb.velocity;

import java.io.IOException;
import java.util.Properties;

import org.apache.velocity.app.VelocityEngine;
import org.apache.velocity.exception.VelocityException;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
 
@Configuration
public class ApplicationConfig {
 
    @Bean
    public JavaMailSender getMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
 
        mailSender.setHost("smtp.gmail.com");
        mailSender.setPort(465);
        mailSender.setUsername("ssbank.sist");
        mailSender.setPassword("Tkddyddmsgod");
 
        Properties javaMailProperties = new Properties();
        javaMailProperties.put("mail.transport.protocol", "smtp");
        javaMailProperties.put("mail.smtp.port", "465");   
        javaMailProperties.put("mail.smtp.starttls.enable", "true");   
        javaMailProperties.put("mail.smtp.auth", "true");   
        javaMailProperties.put("mail.smtp.socketFactory.port", "465");   
        javaMailProperties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");   
        javaMailProperties.put("mail.smtp.socketFactory.fallback", "false");  
        javaMailProperties.put("mail.debug", "true");
 
        mailSender.setJavaMailProperties(javaMailProperties);
        return mailSender;
    }
 
    @Bean
    public VelocityEngine getVelocityEngine() throws VelocityException, IOException {
        VelocityEngine velocityEngine = new VelocityEngine();
        
        velocityEngine.setProperty("resource.loader", "class");
        velocityEngine.setProperty("class.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
        velocityEngine.setProperty("output.encoding", "UTF-8");

        velocityEngine.getTemplate("/templates/joinMemberTemplate.vm");
        
        return velocityEngine;
    }
}
