package com.crimsonlogic.schedulemeeting.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.format.FormatterRegistry;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    private final StringToLocalDateTimeConverter stringToLocalDateTimeConverter;

    public WebConfig(StringToLocalDateTimeConverter stringToLocalDateTimeConverter) {
        this.stringToLocalDateTimeConverter = stringToLocalDateTimeConverter;
    }

    @Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addConverter(stringToLocalDateTimeConverter);
    }
    
    @Bean
    public MappingJackson2HttpMessageConverter jacksonMessageConverter() {
        MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();
        ObjectMapper objectMapper = new ObjectMapper();
        objectMapper.registerModule(new JavaTimeModule());
        converter.setObjectMapper(objectMapper);
        return converter;
    }
}
