package com.tiarebalbi.kupo.configuration;

import java.util.Arrays;

import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CachingConfigurer;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.concurrent.ConcurrentMapCache;
import org.springframework.cache.interceptor.KeyGenerator;
import org.springframework.cache.interceptor.SimpleKeyGenerator;
import org.springframework.cache.support.SimpleCacheManager;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.context.annotation.Import;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;
import org.springframework.core.io.ClassPathResource;

/**
 * Contexto global da aplicação
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.configuration
 * @since 1.0.0
 * 
 */
@Configuration
@EnableAspectJAutoProxy(proxyTargetClass=true)
@EnableCaching
@ComponentScan({"com.tiarebalbi.kupo.configuration", "com.tiarebalbi.kupo.commons", "com.tiarebalbi.kupo.configuration.security", "com.tiarebalbi.kupo.event","com.tiarebalbi.kupo.functions"})
@Import(value={PersistenceApplicationContext.class, SchedulingApplicationContext.class})
public class GlobalApplicationContext implements CachingConfigurer {

	@Bean
	@Override
	public CacheManager cacheManager() {
		SimpleCacheManager cacheManager = new SimpleCacheManager();
        cacheManager.setCaches(Arrays.asList(new ConcurrentMapCache("kupo_cache_map")));
        return cacheManager;
	}

	@Bean
	@Override
	public KeyGenerator keyGenerator() {
		return new SimpleKeyGenerator();
	}
	
	/**
	 * Bean de configuração do arquivo propertie do sistema.
	 * 
	 * @return {@link PropertySourcesPlaceholderConfigurer}
	 */
	@Bean
	public static PropertySourcesPlaceholderConfigurer properties(){
	  PropertySourcesPlaceholderConfigurer properties = new PropertySourcesPlaceholderConfigurer();
	  properties.setLocation(new ClassPathResource( "application.properties" ));
	  properties.setIgnoreResourceNotFound(false);
	  return properties;
	}
	
	
	
}