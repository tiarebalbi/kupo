package com.tiarebalbi.kupo.configuration.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvider;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.tiarebalbi.kupo.commons.KupoMessage;

/**
 * Implementação do {@link AbstractUserDetailsAuthenticationProvider} para o projeto
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.configuration.security
 * @since 1.0.0
 * 
 */
@Service
public class KupoUserDetailsAuthenticationProvider extends AbstractUserDetailsAuthenticationProvider {
	
	@Autowired
	private KupoUserDetailsService userDetail;
	
	@Autowired
	private KupoMessage message;
	
	@Override
	protected void additionalAuthenticationChecks(UserDetails userDetails, UsernamePasswordAuthenticationToken authentication) throws AuthenticationException {
		
	}

	@Override
	protected UserDetails retrieveUser(String username, UsernamePasswordAuthenticationToken authentication) throws AuthenticationException {
		if(username == null) {
			throw new UsernameNotFoundException("Não foi possível identificar o seu usuário");
		}
		
		UserDetails user = this.userDetail.loadUserByUsername(username);
		if(user == null) {
			throw new BadCredentialsException("User " + username + " not found!");
		}
		
		KupoPasswordEncoder kupoPasswordEncoder = new KupoPasswordEncoder();
		if(!kupoPasswordEncoder.matches(authentication.getCredentials().toString(), user.getPassword())) {
			throw new BadCredentialsException(this.message.getMessage("validation.auth.password.notequal"));
		}
		
		return user;
	}
	
}
