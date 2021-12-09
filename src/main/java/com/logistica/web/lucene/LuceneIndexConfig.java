package com.logistica.web.lucene;

import javax.persistence.EntityManagerFactory;

import org.springframework.context.annotation.Bean;

import com.logistica.web.servicios.LuceneIndexServiceBean;

public class LuceneIndexConfig {

    @Bean
    public LuceneIndexServiceBean luceneIndexServiceBean(EntityManagerFactory entityManagerFactory) {
        LuceneIndexServiceBean luceneIndexServiceBean = new LuceneIndexServiceBean(entityManagerFactory);
        luceneIndexServiceBean.triggerIndexing();
        return luceneIndexServiceBean;
    }

}
