package edu.vn.thpthoabinhbackend.config;

import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@ComponentScan(basePackages={"edu.vn.thpthoabinhbackend.dto"})
@EnableTransactionManagement
public class HibernateConfig {
	// Change the below based on the DBMS you choose
//	private final static String DATABASE_URL  = "jdbc:h2:tcp://localhost/~/onlineshopping";
//	private final static String DATABASE_DRIVER  = "org.h2.Driver";
//	private final static String DATABASE_DIALECT  = "org.hibernate.dialect.H2Dialect";
//	private final static String DATABASE_USERNAME  = "sa";
//	private final static String DATABASE_PASSWORD  = "";
	
	// Change the below based on the DBMS you choose
//	private final static String DATABASE_URL  = "jdbc:jtds:sqlserver://ngocthang.database.windows.net:1433/HoaBinh;instance=SQLEXPRESS";
//	private final static String DATABASE_DRIVER  = "net.sourceforge.jtds.jdbc.Driver";
//	private final static String DATABASE_DIALECT  = "org.hibernate.dialect.SQLServerDialect";
//	private final static String DATABASE_USERNAME  = "ngocthang";
//	private final static String DATABASE_PASSWORD  = "root@123";

//	private final static String DATABASE_URL  = "jdbc:jtds:sqlserver://localhost:1433/HoaBinh;instance=SQLEXPRESS";
//	private final static String DATABASE_DRIVER  = "net.sourceforge.jtds.jdbc.Driver";
//	private final static String DATABASE_DIALECT  = "org.hibernate.dialect.SQLServerDialect";
//	private final static String DATABASE_USERNAME  = "sa";
//	private final static String DATABASE_PASSWORD  = "123456";
	
	private final static String DATABASE_URL  = "jdbc:mysql://localhost/cthptho98nv_hoabinh?useUnicode=yes&characterEncoding=UTF-8";
	private final static String DATABASE_DRIVER  = "com.mysql.jdbc.Driver";
	private final static String DATABASE_DIALECT  = "org.hibernate.dialect.MySQLDialect";
	private final static String DATABASE_USERNAME  = "cthptho98nv_thpthoabinh";
	private final static String DATABASE_PASSWORD  = "Hoabinh@012345678";
	
//	private final static String DATABASE_URL  = "jdbc:mysql://localhost:3306/hoabinh?useUnicode=yes&characterEncoding=UTF-8";
//	private final static String DATABASE_DRIVER  = "com.mysql.jdbc.Driver";
//	private final static String DATABASE_DIALECT  = "org.hibernate.dialect.MySQLDialect";
//	private final static String DATABASE_USERNAME  = "root";
//	private final static String DATABASE_PASSWORD  = "root";
	
	// dataSource bean will be available
	@Bean("dataSource")
	public DataSource getDataSource(){
		BasicDataSource dataSource = new BasicDataSource();
		// Providing the database connection information
		dataSource.setDriverClassName(DATABASE_DRIVER);
		dataSource.setUrl(DATABASE_URL);
		dataSource.setUsername(DATABASE_USERNAME);
		dataSource.setPassword(DATABASE_PASSWORD);
		dataSource.setValidationQuery("select 1"); 
		return dataSource;
	}
	// dataSource bean will be available
	@Bean
	public SessionFactory getSessionFactory(DataSource dataSource){
		LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource);
		builder.addProperties(getHibernateProperties());
		builder.scanPackages("edu.vn.thpthoabinhbackend.dto");
		return builder.buildSessionFactory();
	}
	// All the hibernate properties will be return in this method
	private Properties getHibernateProperties() {
		Properties properties = new Properties();
		properties.put("hibernate.dialect", DATABASE_DIALECT);
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.format_sql", "true");
		return properties;
	}
	
	@Bean
	public HibernateTransactionManager getTransactionManager(SessionFactory sessionFactory){
		HibernateTransactionManager transactionManager = new HibernateTransactionManager(sessionFactory);
		return transactionManager;
	}
}
