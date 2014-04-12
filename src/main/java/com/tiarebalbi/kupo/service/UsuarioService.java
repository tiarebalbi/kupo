package com.tiarebalbi.kupo.service;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.access.prepost.PreAuthorize;

import com.mysema.query.types.Predicate;
import com.tiarebalbi.kupo.exceptions.KupoPersistenceException;
import com.tiarebalbi.kupo.models.Usuario;
import com.tiarebalbi.kupo.repository.UsuarioRepository;

/**
 * Service para utilização e validação dos métodos da classe {@link UsuarioRepository} 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.service
 * @since 1.0.0
 */
public interface UsuarioService {
	
	/**
	 * Busca todos os registros com paginacao
	 * 
	 * @param page 
	 * @param condicao
	 * @return {@link Page}
	 */
	@PreAuthorize("hasAnyRole('ROLE_USUARIO_LER', 'ROLE_ROOT')")
	Page<Usuario> buscarTodos(PageRequest page);
	
	/**
	 * Busca todos os registros com paginacao e condicao
	 * 
	 * @param page 
	 * @param condicao
	 * @return {@link Page}
	 */
	@PreAuthorize("hasAnyRole('ROLE_USUARIO_LER', 'ROLE_ROOT')")
	Page<Usuario> buscarTodos(PageRequest page, Predicate condicao);
	
	/**
	 * Deve buscar um registro por uma chave primária da entidade {@link Usuario}
	 * 
	 * @param id
	 * @return {@link Usuario}
	 */
	@PreAuthorize("hasAnyRole('ROLE_USUARIO_LER', 'ROLE_ROOT')")
	Usuario buscarRegistro(Long id);

	/**
	 * Deve buscar um registro por uma condição da entidade {@link Usuario}
	 * 
	 * @param condicao
	 * @return {@link Usuario}
	 */
	@PreAuthorize("hasAnyRole('ROLE_USUARIO_VISUALIZAR', 'ROLE_ROOT')")
	Usuario buscarRegistro(Predicate condicao);
	
	/**
	 * Salvar um novo registro
	 * 
	 * @param entidade
	 * @return {@link Usuario}
	 * @throws KupoPersistenceException 
	 */
	@PreAuthorize("hasAnyRole('ROLE_USUARIO_SALVAR', 'ROLE_ROOT')")
	Usuario salvar(Usuario entidade) throws KupoPersistenceException;
	
	/**
	 * Método para exclusao de entidade por id
	 * 
	 * @param id
	 * @return {@link Usuario}
	 * @throws KupoPersistenceException 
	 */
	@PreAuthorize("hasAnyRole('ROLE_USUARIO_EXCLUIR', 'ROLE_ROOT')")
	Usuario excluir(Long id) throws KupoPersistenceException;
	
	/**
	 * Método para exclusao de entidade por pbjeto
	 * 
	 * @param entidade
	 * @return {@link Usuario}
	 * @throws KupoPersistenceException 
	 */
	@PreAuthorize("hasAnyRole('ROLE_USUARIO_EXCLUIR', 'ROLE_ROOT')")
	Usuario excluir(Usuario entidade) throws KupoPersistenceException;

	/**
	 * Método excluiso para autenticação de usuários no sistema
	 * @param buscarPorLogin
	 * @return {@link Usuario}
	 */
	Usuario authentication(Predicate buscarPorLogin);

}
