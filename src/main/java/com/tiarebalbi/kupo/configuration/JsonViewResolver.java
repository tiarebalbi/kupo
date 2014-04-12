package com.tiarebalbi.kupo.configuration;

import java.util.Locale;

import org.springframework.web.servlet.View;
import org.springframework.web.servlet.ViewResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

/**
 * JSON View Resolver
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.configuration
 * @since 1.0.0
 * 
 */
public class JsonViewResolver implements ViewResolver{

	@Override
	public View resolveViewName(String viewName, Locale locale) throws Exception {
		MappingJackson2JsonView view = new MappingJackson2JsonView();
        view.setPrettyPrint(true);
        view.setContentType("application/json");
        return view;
	}

}
