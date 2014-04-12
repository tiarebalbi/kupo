package com.tiarebalbi.kupo.configuration;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.server.standard.TomcatRequestUpgradeStrategy;
import org.springframework.web.socket.server.support.DefaultHandshakeHandler;

/**
 * Classe de configuração do contexto do websocket
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.configuration
 * @since 1.0.0
 * 
 */
@Configuration
@EnableWebSocketMessageBroker
public class WebSocketApplicationContext extends AbstractWebSocketMessageBrokerConfigurer {

	@Autowired
	private Environment env;

	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		if (env.acceptsProfiles("test.tomcat")) {
			registry.addEndpoint("/application")
					.setHandshakeHandler(
							new DefaultHandshakeHandler(new TomcatRequestUpgradeStrategy()))
					.withSockJS();
		} else {
			registry.addEndpoint("/application").withSockJS();
		}
	}

	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		registry.enableSimpleBroker("/queue/", "/topic/");
		registry.setApplicationDestinationPrefixes("/app");
	}
}