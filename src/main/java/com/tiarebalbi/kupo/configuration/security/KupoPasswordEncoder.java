package com.tiarebalbi.kupo.configuration.security;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.configuration.security
 * @since 1.0.0
 * 
 */
public class KupoPasswordEncoder implements PasswordEncoder {

	@Override
	public String encode(CharSequence pass) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		String result = encoder.encode(pass);
		return result;
	}

	@Override
	public boolean matches(CharSequence raw, String encoded) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.matches(raw, encoded);
	}

}
