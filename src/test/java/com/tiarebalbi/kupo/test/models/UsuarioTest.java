package com.tiarebalbi.kupo.test.models;

import static org.junit.Assert.*;

import org.junit.Test;

import com.tiarebalbi.kupo.models.TipoUsuario;
import com.tiarebalbi.kupo.models.Usuario;

/**
 * Usuário Entity Test
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.test.models
 * @since 1.0.0
 * 
 */
public class UsuarioTest {
	
	/**
	 * 
	 */
	@Test
	public void deveTestarGetterESettersDaEntidade() {
		
		Usuario usuario = new Usuario();
		usuario.setId(new Long(1));
		usuario.setEmail("tiarebalbi@me.com");
		usuario.setLogin("tiare");
		usuario.setNome("Tiarê Balbi");
		usuario.setSenha("xxak2io2io1oioi1jio21joi1jio");
		usuario.setStatus(Boolean.FALSE);
		usuario.setTipo(TipoUsuario.ROOT);
		
		assertEquals(new Long(1), usuario.getId());
		assertEquals("tiarebalbi@me.com", usuario.getEmail());
		assertEquals("tiare", usuario.getLogin());
		assertEquals("Tiarê Balbi", usuario.getNome());
		assertEquals("xxak2io2io1oioi1jio21joi1jio", usuario.getSenha());
		assertEquals(Boolean.FALSE, usuario.getStatus());
		assertEquals(TipoUsuario.ROOT, usuario.getTipo());
		
		
	}

}
