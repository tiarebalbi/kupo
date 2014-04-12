package com.tiarebalbi.kupo.configuration.security;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;

import com.tiarebalbi.kupo.models.Usuario;

/**
 * Classes Auxiliar para acesso de informações relacionadas ao usuário logado
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.configuration.security
 * @since 1.0.0
 * 
 */
public class KupoSecurityAssistent {
	
	/**
	 * 
	 * @return {@link Usuario} retorna o usuário logado 
	 */
	public static Usuario currentUser() {
		KupoUserDetail userDetail = (KupoUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return userDetail.getUsuario();
	}
	
	/**
	 * Verifica se o usuário possui uma determinada regra
	 * 
	 * @param role String 
	 * @return {@link Boolean}
	 */
	public static Boolean hasRole(String role) {
		SecurityContext context = SecurityContextHolder.getContext();
		
		if(context == null) {
			return false;
		}
		
		Authentication auth = context.getAuthentication();
		if(auth == null) {
			return false;
		}
		
		for (GrantedAuthority grantedRole :  auth.getAuthorities()) {
			if(role.equals(grantedRole.getAuthority())) {
				return true;
			}
		}
		
		return false;
	}

}