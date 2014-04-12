package com.tiarebalbi.kupo.integration.test.repository;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import javax.annotation.Resource;

import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;

import com.tiarebalbi.kupo.integration.configuration.PersistenceTestApplicationContext;
import com.tiarebalbi.kupo.models.TipoUsuario;
import com.tiarebalbi.kupo.models.Usuario;
import com.tiarebalbi.kupo.repository.UsuarioRepository;
import com.tiarebalbi.kupo.repository.predicate.UsuarioPredicate;

/**
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.integration.test.repository
 * @since 1.0.0
 */
@ContextConfiguration(classes = PersistenceTestApplicationContext.class)
@TransactionConfiguration(transactionManager = "transactionManager", defaultRollback = true)
@RunWith(SpringJUnit4ClassRunner.class)
public class UsuarioRepositoryTest {
	
	@Resource
	private UsuarioRepository usuarioRepository;
	
	/**
	 * 
	 */
	@Test
	public void deveBuscarUmRegistroExistentePorId() {
		Usuario usuario = new Usuario("Tiare", "tiarebalbi@me.com", "tiare", "481200", Boolean.TRUE, TipoUsuario.ASSINANTE);
		Usuario retorno = this.usuarioRepository.save(usuario);
		assertNotNull(retorno);
		assertNotNull(retorno.getId());
		
		Usuario retornoBusca = this.usuarioRepository.findOne(retorno.getId());
		assertNotNull(retornoBusca);
		assertNotNull(retornoBusca.getId());
		
		assertEquals(retorno.getId(), retornoBusca.getId());
		assertEquals("tiare", retornoBusca.getLogin());

		this.usuarioRepository.delete(retornoBusca.getId());
	}
	
	/**
	 * 
	 */
	@Test
	public void deveBuscarUmRegistroPorCondicao() {
		
		Usuario usuario = new Usuario("Tiare", "tiarebalbi@me.com", "tiare", "481200", Boolean.TRUE, TipoUsuario.ROOT);
		Usuario retorno = this.usuarioRepository.save(usuario);
		assertNotNull(retorno);
		assertNotNull(retorno.getId());
		
		Usuario retornoBusca = this.usuarioRepository.findOne(UsuarioPredicate.buscarPorLogin(retorno.getLogin()));
		assertNotNull(retornoBusca);
		assertNotNull(retornoBusca.getId());
		assertEquals("tiare", retornoBusca.getLogin());
		
		this.usuarioRepository.delete(retornoBusca);
		
		
	}
	
	/**
	 * 
	 */
	@Test
	public void deveExcluirUmObjeto() {
		
		Usuario usuario = new Usuario("Tiare", "tiarebalbi@me.com", "tiare", "481200", Boolean.TRUE, TipoUsuario.ROOT);
		Usuario retorno = this.usuarioRepository.save(usuario);
		assertNotNull(retorno);
		assertNotNull(retorno.getId());
		
		this.usuarioRepository.delete(retorno);
		
		Page<Usuario> dados = this.usuarioRepository.findAll(new PageRequest(0, 20));
		assertTrue(dados.getContent().size() == 0);
	}
	
	/**
	 * 
	 */
	@Test
	public void deveExcluirPorId() {
		
		Usuario usuario = new Usuario("Tiare", "tiarebalbi@me.com", "tiare", "481200", Boolean.TRUE, TipoUsuario.ROOT);
		Usuario retorno = this.usuarioRepository.save(usuario);
		assertNotNull(retorno);
		assertNotNull(retorno.getId());
		
		this.usuarioRepository.delete(retorno.getId());
		
		Page<Usuario> dados = this.usuarioRepository.findAll(new PageRequest(0, 20));
		assertTrue(dados.getContent().size() == 0);
	}
	
	/**
	 * 
	 */
	@Test
	public void deveBuscarTodosComPaginacao() {
		for(int i = 0; i< 10; i++) {
			
			Boolean status = Boolean.FALSE;
			
			if((i % 9) == 0) {
				status = Boolean.TRUE;
			}
			
			Usuario usuario = new Usuario("Tiare"+i, i+"tiarebalbi@me.com", "tiare"+i, "481200"+i, status, TipoUsuario.ROOT);
			this.usuarioRepository.save(usuario);
		}
		
		Page<Usuario> infos = this.usuarioRepository.findAll(new PageRequest(0, 20));
		assertNotNull(infos.getContent());
		assertTrue(infos.getContent().size() == 10);
		
		for (Usuario yse : infos.getContent()) {
			this.usuarioRepository.delete(yse);
		}
		
		Page<Usuario> confirmacao = this.usuarioRepository.findAll(new PageRequest(0, 20));
		assertTrue(confirmacao.getContent().size() == 0);
	}
	
	/**
	 * 
	 */
	@Test
	public void deveBuscarTodosComPaginacaoECondicao() {
		Boolean status = Boolean.FALSE;
		for(int i = 0; i< 10; i++) {
			if(status) {
				status = Boolean.FALSE;
			}else {
				status = Boolean.TRUE;
			}
			
			Usuario usuario = new Usuario("Tiare"+i, i+"tiarebalbi@me.com", "tiare"+i, "481200"+i, status, TipoUsuario.ROOT);
			this.usuarioRepository.save(usuario);
		}
		
		Page<Usuario> infos = this.usuarioRepository.findAll(UsuarioPredicate.buscarPorStatus(Boolean.TRUE),new PageRequest(0, 20));
		assertTrue(infos.getContent().size() == 5);
	}
	
	/**
	 * 
	 */
	@After
	public void after() {
		Page<Usuario> confirmacao = this.usuarioRepository.findAll(new PageRequest(0, 20));
		for (Usuario ysea : confirmacao.getContent()) {
			this.usuarioRepository.delete(ysea.getId());
		}
	}

}
