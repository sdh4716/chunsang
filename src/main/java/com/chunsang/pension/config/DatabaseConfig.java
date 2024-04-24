package com.chunsang.pension.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;

public class DatabaseConfig {

	// 데이터베이스 연결에 사용
    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(dataSource);
        return sessionFactory.getObject();
    }
    
    // SqlSessionTemplate은 SqlSession의 구현체이며, 스프링에서 SqlSession을 관리하고 트랜잭션을 처리하는 데 사용
    // 접속 및 반환을 Spring에서 알아서 처리해줌
    @Bean
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }
	
}
