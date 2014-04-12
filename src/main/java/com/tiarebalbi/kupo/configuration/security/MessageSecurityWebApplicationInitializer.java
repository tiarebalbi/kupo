package com.tiarebalbi.kupo.configuration.security;

import org.springframework.security.web.context.AbstractSecurityWebApplicationInitializer;

/**
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.configuration.security
 * @since 1.0.0
 * 
 */
public class MessageSecurityWebApplicationInitializer extends
		AbstractSecurityWebApplicationInitializer {

	@Override
	protected boolean enableHttpSessionEventPublisher() {
		return true;
	}
}
