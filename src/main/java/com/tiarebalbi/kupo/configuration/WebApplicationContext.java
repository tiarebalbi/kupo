package com.tiarebalbi.kupo.configuration;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.http.MediaType;
import org.springframework.validation.beanvalidation.LocalValidatorFactoryBean;
import org.springframework.web.accept.ContentNegotiationManager;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.config.annotation.ContentNegotiationConfigurer;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;
import org.springframework.web.servlet.handler.SimpleMappingExceptionResolver;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;
import org.springframework.web.servlet.view.tiles3.TilesConfigurer;
import org.springframework.web.servlet.view.tiles3.TilesViewResolver;

import com.fasterxml.jackson.databind.ObjectMapper;
/**
 * Class de configuração do contexto web
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.configuration
 * @since 1.0.0
 * 
 */
@Configuration
@EnableWebMvc
@ComponentScan(basePackages={"com.tiarebalbi.kupo.controller", "com.tiarebalbi.kupo.api", "com.tiarebalbi.kupo.validator","com.tiarebalbi.kupo.advice"})
public class WebApplicationContext extends WebMvcConfigurerAdapter {
	
	private static final String VIEW_RESOLVER_PREFIX = "/WEB-INF/views/";
	private static final String VIEW_RESOLVER_SUFFIX = ".jsp";
	
	@Autowired
	private Environment env;

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}
	
	/**
	 * Bean para configuração do Exception Resolver
	 * @return {@link SimpleMappingExceptionResolver}
	 */
	@Bean
    public SimpleMappingExceptionResolver exceptionResolver() {
        SimpleMappingExceptionResolver exceptionResolver = new SimpleMappingExceptionResolver();

        Properties exceptionMappings = new Properties();

        exceptionMappings.put("com.tiarebalbi.kupo.exceptions.PersistenceException", "error/application");
        exceptionMappings.put("com.tiarebalbi.kupo.exceptions.SocketException", "error/application");
        exceptionMappings.put("com.tiarebalbi.kupo.exceptions.SecurityException", "error/application");
        exceptionMappings.put("com.tiarebalbi.kupo.exceptions.WebConversorException", "error/application");
        exceptionMappings.put("com.tiarebalbi.kupo.exceptions.WebValidationException", "error/application");
        exceptionMappings.put("java.lang.Exception", "error/undefined");
        exceptionMappings.put("java.lang.RuntimeException", "error/runtime-error");

        exceptionResolver.setExceptionMappings(exceptionMappings);

        Properties statusCodes = new Properties();

        statusCodes.put("error/nonexist", "404");
        statusCodes.put("error/application", "500");
        statusCodes.put("error/undefined", "500");
        statusCodes.put("error/runtime-error", "500");

        exceptionResolver.setStatusCodes(statusCodes);

        return exceptionResolver;
    }
	
	/**
	 * Configuração para troca de idiomas no sistema
	 * 
	 * @return {@link LocaleChangeInterceptor}
	 */
	@Bean
	public LocaleChangeInterceptor localeInterceptor() {
		LocaleChangeInterceptor locale = new LocaleChangeInterceptor();
		locale.setParamName("lang");
		return locale;
	}
	
	/**
	 * Objeto para realizar as conversões padrões na utilização de json
	 * 
	 * @return {@link ObjectMapper}
	 */
	@Bean
	public ObjectMapper mapper() {
		ObjectMapper mapper = new ObjectMapper();
		return mapper;
	}
	
	
	/**
	 * JSTL View Resolver
	 * 
	 * @return {@link ViewResolver}
	 */
	@Bean
    public ViewResolver viewResolver() {
        InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();

        viewResolver.setViewClass(JstlView.class);
        viewResolver.setPrefix(VIEW_RESOLVER_PREFIX);
        viewResolver.setSuffix(VIEW_RESOLVER_SUFFIX);
        viewResolver.setOrder(2);

        return viewResolver;
    }
	
	/**
	 * Configuração do bean de validação JSR-303
	 * @return {@link LocalValidatorFactoryBean}
	 */
	@Bean
	public LocalValidatorFactoryBean validatorBean() {
		LocalValidatorFactoryBean bean = new  LocalValidatorFactoryBean();
		bean.setValidationMessageSource(messageSource());
		return bean;
	}
	
	/**
	 * Bean de configuração da internacionalização
	 * @return {@link MessageSource}
	 */
	@Bean
    public MessageSource messageSource() {
        ResourceBundleMessageSource messageSource = new ResourceBundleMessageSource();
        messageSource.setBasenames("i18n/messages_pt_BR", "i18n/messages_en_US");
        messageSource.setUseCodeAsDefaultMessage(true);
        messageSource.setDefaultEncoding("UTF-8");
        return messageSource;
    }
	
	/**
 	 * @return {@link CommonsMultipartResolver}
	 */
	@Bean
	public CommonsMultipartResolver updateResolver() {
		CommonsMultipartResolver resolver = new CommonsMultipartResolver();
		resolver.setMaxUploadSize(this.env.getRequiredProperty("system.max.update", Long.class));
		return resolver;
	}
	
	/**
	 * Definições do Apache Tiles
	 * 
	 * @return {@link TilesConfigurer}
	 */
	@Bean
	public TilesConfigurer configuracaoTiles() {
		TilesConfigurer config = new TilesConfigurer();
		String[] definicoes = new String[2];
		definicoes[0] = "/WEB-INF/views/web-tiles.xml";
		definicoes[1] = "/WEB-INF/views/**/kupo-*.xml";

		config.setDefinitions(definicoes);
		return config;
	}

	/**
	 * Configuração do viewResolver do Apache Tiles
	 * 
	 * @return {@link TilesViewResolver} 
	 */
	@Bean
	public TilesViewResolver tilesViewResolver() {
		TilesViewResolver view = new TilesViewResolver();
		view.setContentType("text/html");
		view.setOrder(1);
		return view;
	}
	
	/**
	 * @return {@link JsonViewResolver}
	 */
	@Bean
	public JsonViewResolver jsonViewResolver() {
		return new JsonViewResolver();
	}
	
	@Override
	public void configureContentNegotiation(ContentNegotiationConfigurer configurer) {
		configurer.favorPathExtension(false)
				  .favorParameter(false)
				  .defaultContentType(MediaType.TEXT_HTML)
				  .useJaf(false)
				  .mediaType("html", MediaType.TEXT_HTML)
				  .mediaType("json", MediaType.APPLICATION_JSON);
		
	}

	/**
	 * Negociador do ViewResolver
	 * @param manager {@link ContentNegotiationManager}
	 * 
	 * @return {@link ContentNegotiatingViewResolver}
	 */
	@Bean
	public ContentNegotiatingViewResolver contentNegotiatingViewResolver(ContentNegotiationManager manager) {
		List<ViewResolver> viewResolvers = new ArrayList<ViewResolver>();

		viewResolvers.add(this.tilesViewResolver());
		viewResolvers.add(this.viewResolver());
		viewResolvers.add(this.jsonViewResolver());

		ContentNegotiatingViewResolver resolver = new ContentNegotiatingViewResolver();
        resolver.setContentNegotiationManager(manager);
        resolver.setViewResolvers(viewResolvers);
        return resolver;
	}
	
}
