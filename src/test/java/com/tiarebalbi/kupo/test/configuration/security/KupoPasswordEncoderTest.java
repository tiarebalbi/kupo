package com.tiarebalbi.kupo.test.configuration.security;

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertTrue;

import org.junit.Test;

import com.tiarebalbi.kupo.configuration.security.KupoPasswordEncoder;

/**
 * 
 * Teste da classe {@link KupoPasswordEncoder}
 * 
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.test.configuration.security
 * @since 1.0.0
 * 
 */
public class KupoPasswordEncoderTest {
	
	/**
	 * 
	 */
	@Test
	public void deveValidarPasswordIgual() {
		KupoPasswordEncoder pass = new KupoPasswordEncoder();
		String senha = pass.encode("481200");
		assertNotEquals("481200", senha);
		System.out.println(senha);
		assertTrue(pass.matches("481200", senha));
	}

	
	/**
	 * 
	 */
	@Test
	public void deveGerarErroComSenhaIncorreta() {
		KupoPasswordEncoder pass = new KupoPasswordEncoder();
		String senha = pass.encode("tiare");
		assertFalse(pass.matches("tiare2", senha));
	}
	
	
}
