package com.feuji.referenceservice.config;

import org.modelmapper.ModelMapper;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableJpaRepositories(basePackages = {"com.feuji.referenceservice"})
@EnableTransactionManagement
public class JPAConfig {
	

	 @Bean
	    public ModelMapper modelMapper() {
	        return new ModelMapper();
	 }
}
