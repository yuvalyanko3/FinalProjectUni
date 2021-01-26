package project.naveyosefcc.config;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;

import utils.Consts;

import javax.sql.DataSource;
import java.beans.PropertyVetoException;
import java.util.logging.Logger;

@Configuration
@PropertySource("classpath:application.properties")
public class AppConfig {

    //variable that holds properties from "application.properties"
    @Autowired
    private Environment env;
    private Logger logger = Logger.getLogger(getClass().getName());

    @Bean
    public DataSource securityDataSource(){
        ComboPooledDataSource securityDataSource = new ComboPooledDataSource();
        //logging
        logger.info(">>> jdbc.url=" + env.getProperty("spring.datasource.url"));
        logger.info(">>> jdbc.user=" + env.getProperty("spring.datasource.username"));
        try {
            securityDataSource.setDriverClass(env.getProperty("jdbc.driver"));
        } catch (PropertyVetoException e) {
            e.printStackTrace();
        }
        securityDataSource.setJdbcUrl(env.getProperty("spring.datasource.url"));
        securityDataSource.setUser(env.getProperty("spring.datasource.username"));
        securityDataSource.setPassword(env.getProperty("spring.datasource.password"));
        securityDataSource.setInitialPoolSize(getPropertyIntVal(Consts.INITIAL_POOL_SIZE));
        securityDataSource.setInitialPoolSize(getPropertyIntVal(Consts.MIN_POOL_SIZE));
        securityDataSource.setInitialPoolSize(getPropertyIntVal(Consts.MAX_POOL_SIZE));
        securityDataSource.setInitialPoolSize(getPropertyIntVal(Consts.MAX_IDLE_TIME));
        return securityDataSource;
    }

    //helper method
    private int getPropertyIntVal(String property){
        return Integer.parseInt(env.getProperty(property));
    }
}
