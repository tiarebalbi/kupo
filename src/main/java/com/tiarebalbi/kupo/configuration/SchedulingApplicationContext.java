package com.tiarebalbi.kupo.configuration;

import java.util.Collection;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.env.Environment;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.SchedulingConfigurer;
import org.springframework.scheduling.config.ScheduledTaskRegistrar;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.concurrent.DelegatingSecurityContextScheduledExecutorService;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 * Contexto de configuração do agendador de tarefa do sistema
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.configuration
 * @since 1.0.0
 * 
 */
@Configuration
@EnableScheduling
@EnableAsync
public class SchedulingApplicationContext implements SchedulingConfigurer {
	
	@Autowired
	private Environment env;

	@Override
	public void configureTasks(ScheduledTaskRegistrar taskRegistrar) {
		taskRegistrar.setScheduler(taskExecutor());
	}
	
	/**
	 * Configuração da concorrencia do spring security
	 * 
	 * @return {@link Executor}
	 */
	@Bean
    public Executor taskExecutor() {
        ScheduledExecutorService delegateExecutor = Executors.newSingleThreadScheduledExecutor();
        SecurityContext schedulerContext = createSchedulerSecurityContext();
        return new DelegatingSecurityContextScheduledExecutorService(delegateExecutor, schedulerContext);
    }
	
	private SecurityContext createSchedulerSecurityContext() {
		String role = this.env.getRequiredProperty("concurrency.role.job");
		
        SecurityContext context = SecurityContextHolder.createEmptyContext();

        Collection<GrantedAuthority> authorities = AuthorityUtils.createAuthorityList(role);
        Authentication authentication = new UsernamePasswordAuthenticationToken("job_user",role,authorities);
        context.setAuthentication(authentication);

        return context;
    }

}
