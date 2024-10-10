package com.crimsonlogic.schedulemeeting.config;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

@Component
public class StringToLocalDateTimeConverter implements Converter<String, LocalDateTime> {

    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ISO_LOCAL_DATE_TIME;

    @Override
    public LocalDateTime convert(String source) {
        if (source == null || source.isEmpty()) {
            return null;
        }
        return LocalDateTime.parse(source, FORMATTER);
    }
}
