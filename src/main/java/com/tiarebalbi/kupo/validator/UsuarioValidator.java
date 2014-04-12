package com.tiarebalbi.kupo.validator;

import java.util.Arrays;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.tiarebalbi.kupo.models.Usuario;

/**
 * Validator da Entidade {@link Usuario}
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.validator
 * @since 1.0.0 
 * 
 */
@Component
public class UsuarioValidator implements Validator{
	
	private static final String EMAIL_PATTERN = 
			"^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
			+ "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

	@Override
	public boolean supports(Class<?> clazz) {
		return Usuario.class.equals(clazz);
	}

	@Override
	public void validate(Object object, Errors e) {
		ValidationUtils.rejectIfEmpty(e, "nome", "validation.input.notnull");
		ValidationUtils.rejectIfEmpty(e, "sobrenome", "validation.input.notnull");
		ValidationUtils.rejectIfEmpty(e, "login", "validation.input.notnull");
		ValidationUtils.rejectIfEmpty(e, "email", "validation.input.notnull");
		ValidationUtils.rejectIfEmpty(e, "status", "validation.input.notnull");
		ValidationUtils.rejectIfEmptyOrWhitespace(e, "tipo", "validation.input.notnull");
		ValidationUtils.rejectIfEmptyOrWhitespace(e, "idioma", "validation.input.notnull");
		
		Usuario usuario = (Usuario) object;
		
		// Login
		if(usuario.getLogin().length() < 5 || usuario.getLogin().length() > 25) {
			Object[] dados = Arrays.asList("usuário de acesso", "5", "25").toArray();
			ValidationUtils.rejectIfEmpty(e, "idioma", "validation.input.size", dados);
		}
		
		// Senha
		if(usuario.getSenha().length() < 5 || usuario.getSenha().length() > 25) {
			Object[] dados = Arrays.asList("senha", "5", "25").toArray();
			ValidationUtils.rejectIfEmpty(e, "idioma", "validation.input.size", dados);
		}
		
		// Email
		Pattern pattern = Pattern.compile(EMAIL_PATTERN);
		Matcher match = pattern.matcher(usuario.getEmail());
		if(!match.matches()) {
			Object[] dados = Arrays.asList(usuario.getEmail()).toArray();
			ValidationUtils.rejectIfEmpty(e, "idioma", "validation.input.email.invalid", dados);
		}
		
	}

}
