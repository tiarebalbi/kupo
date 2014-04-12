package com.tiarebalbi.kupo.configuration.initializer;

import java.util.EnumSet;

import javax.servlet.DispatcherType;
import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration.Dynamic;

import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.filter.DelegatingFilterProxy;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

import com.opensymphony.sitemesh.webapp.SiteMeshFilter;
import com.tiarebalbi.kupo.configuration.GlobalApplicationContext;
import com.tiarebalbi.kupo.configuration.SecurityApplicationContext;
import com.tiarebalbi.kupo.configuration.WebApplicationContext;
import com.tiarebalbi.kupo.configuration.WebSocketApplicationContext;

/**
 * Inicialização da servlet
 * 
 * @author Tiarê Balbi Bonamini
 * @since 1.0.0-A1
 *
 */
public class DispatcherServletInitializerContext extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class<?>[] { GlobalApplicationContext.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class<?>[] { WebApplicationContext.class, SecurityApplicationContext.class, WebSocketApplicationContext.class};    
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}
	
	@Override
	protected void customizeRegistration(Dynamic registration) {
		registration.setInitParameter("dispatchOptionsRequest", "true");
        registration.setAsyncSupported(true);
        registration.addMapping("/");
	}
	
	@Override
	public void onStartup(ServletContext servletContext) throws ServletException {

		servletContext.addListener(HttpSessionEventPublisher.class);
		
		FilterRegistration.Dynamic securityFilter = servletContext.addFilter("securityFilter", new DelegatingFilterProxy("springSecurityFilterChain"));
        securityFilter.addMappingForUrlPatterns(EnumSet.allOf(DispatcherType.class), true, "/*");

        FilterRegistration.Dynamic characterEncodingFilter = servletContext.addFilter("characterEncodingFilter", new CharacterEncodingFilter());
        characterEncodingFilter.addMappingForUrlPatterns(EnumSet.allOf(DispatcherType.class), true, "/*");
        characterEncodingFilter.setInitParameter("encoding", "UTF-8");
        
        FilterRegistration.Dynamic siteMeshFilter = servletContext.addFilter("siteMeshFilter", new SiteMeshFilter());
        siteMeshFilter.setAsyncSupported(true);
        
		super.onStartup(servletContext);
	}
}
