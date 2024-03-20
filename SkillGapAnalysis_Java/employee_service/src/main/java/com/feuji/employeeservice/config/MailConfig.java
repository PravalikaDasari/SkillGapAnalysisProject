package com.feuji.employeeservice.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

public class MailConfig {
	
	@Bean
    public JavaMailSender javaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
//        mailSender.setHost("your-mail-server-host"); // e.g., "smtp.gmail.com"
//        mailSender.setPort(587); // Use the appropriate port for your mail server
//        mailSender.setUsername("your-email@example.com"); // Your email address
//        mailSender.setPassword("your-email-password"); // Your email password

        // Additional properties, if needed
//        Properties properties = mailSender.getJavaMailProperties();
//        properties.put("mail.transport.protocol", "smtp");
//        properties.put("mail.smtp.auth", "true");
//        properties.put("mail.smtp.starttls.enable", "true");
//        properties.put("mail.debug", "true"); // Enable debugging for troubleshooting
        return mailSender;
    }

}
