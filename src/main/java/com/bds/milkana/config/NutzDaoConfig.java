package com.bds.milkana.config;

import org.nutz.dao.Dao;
import org.nutz.dao.impl.NutDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;

@Configuration
@Component("dao")
public class NutzDaoConfig extends NutDao implements Dao {
    DataSource druidDataSource;

    @Autowired
    public void setDruidDataSource(DataSource druidDataSource) {
        this.druidDataSource = druidDataSource;
        setDataSource(druidDataSource);
    }
}

