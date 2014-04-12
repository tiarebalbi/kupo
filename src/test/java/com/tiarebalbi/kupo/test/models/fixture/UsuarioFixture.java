package com.tiarebalbi.kupo.test.models.fixture;

import java.util.List;

import br.com.six2six.fixturefactory.Fixture;
import br.com.six2six.fixturefactory.Rule;

import com.tiarebalbi.kupo.models.TipoUsuario;
import com.tiarebalbi.kupo.models.Usuario;

/**
 * Definição randomica de informações do modelo {@link Usuario}
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.test.models.fixture
 * @since 1.0.0
 * 
 */
public class UsuarioFixture {
	
	/**
	 * 
	 */
	public static final String TEMPLATE_NAME = "valid";

	private static void template() {
		Fixture.of(Usuario.class).addTemplate(TEMPLATE_NAME, new Rule(){{
		    add("nome", random("Tiare Balbi", "Renato", "Rafael", "Joao", "Kaka"));
		    add("senha", random("481200", "XaKa2ipa"));
		    add("login", random("tuani", "tiare", "kaka","rafael","joao"));
		    add("email", "${login}@gmail.com");
		    add("status", random(Boolean.FALSE, Boolean.TRUE));
		    add("tipo", random(TipoUsuario.ASSINANTE,TipoUsuario.ROOT, TipoUsuario.ROOT));
		}});
	}
	
	/**
	 * @return Usuario
	 */
	public static Usuario getSingleValue() {
		template();
		Usuario retorno = Fixture.from(Usuario.class).gimme(TEMPLATE_NAME);
		return retorno;
	}
	
	/**
	 * @param size total de registros a verificar 
	 * @return Usuario
	 */
	public static List<Usuario> getMultValues(int size) {
		template();
		List<Usuario> retorno = Fixture.from(Usuario.class).gimme(size, TEMPLATE_NAME);
		return retorno;
	}

}
