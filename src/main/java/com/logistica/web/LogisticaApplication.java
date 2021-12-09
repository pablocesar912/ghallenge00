package com.logistica.web;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;

import com.logistica.web.lucene.LuceneIndexConfig;

@SpringBootApplication
@Import(LuceneIndexConfig.class)
public class LogisticaApplication {

    public static void main(String[] args) {
        SpringApplication.run(LogisticaApplication.class, args);
    }

}
