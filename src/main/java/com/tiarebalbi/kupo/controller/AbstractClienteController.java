package com.tiarebalbi.kupo.controller;

import org.springframework.security.core.context.SecurityContextHolder;

import com.tiarebalbi.kupo.configuration.security.KupoUserDetail;
import com.tiarebalbi.kupo.models.Usuario;

/**
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.controller.administracao
 * @since 1.0.0
 * 
 */
public abstract class AbstractClienteController {
	
	protected Usuario getCurrentUser() {
		KupoUserDetail userDetail = (KupoUserDetail) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return userDetail.getUsuario();
	}

}
