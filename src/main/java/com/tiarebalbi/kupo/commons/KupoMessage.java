package com.tiarebalbi.kupo.commons;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Component;

import com.tiarebalbi.kupo.configuration.security.KupoUserDetail;
import com.tiarebalbi.kupo.models.TipoIdioma;

/**
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.models.commons
 * @since 1.0.0
 * 
 */
@Component
public class KupoMessage {
	
	@Autowired
	private MessageSource message;
	
	/**
	 * @param chave chave de acesso a mensagem
	 * @param params parametros para complemento da mensagem
	 * @return String mensagem de retorno
	 */
	public String getMessage(String chave, Object... params) {
		String sigla = "";
		
		// Verificando idioma do usuário
		Authentication context = SecurityContextHolder.getContext().getAuthentication();
		if(context != null) {
			KupoUserDetail principal = (KupoUserDetail) context.getPrincipal();
			sigla = principal.getUsuario().getIdioma().getSigla();
		}
		if(sigla == "" || sigla == null) {
			sigla = TipoIdioma.PORTUGUES.getSigla();
		}
		
		Locale defaultLocale = new Locale(sigla);
		return message.getMessage(chave, params, defaultLocale);
	}
}
