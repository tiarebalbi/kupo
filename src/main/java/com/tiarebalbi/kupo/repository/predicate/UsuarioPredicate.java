package com.tiarebalbi.kupo.repository.predicate;

import java.util.List;

import com.mysema.query.types.Predicate;
import com.mysema.query.types.expr.BooleanExpression;
import com.tiarebalbi.kupo.dto.KendoDataSource;
import com.tiarebalbi.kupo.dto.KendoDataSource.Filtro;
import com.tiarebalbi.kupo.models.QUsuario;
import com.tiarebalbi.kupo.models.Usuario;

/**
 * Classe com condições de buscas referente a entidade {@link Usuario}
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.repository.predicate
 * @since 1.0.0
 * 
 */
public class UsuarioPredicate {

	/**
	 * @param status Status 
	 * @return {@link Predicate}
	 */
	public static Predicate buscarPorStatus(Boolean status) {
		QUsuario entidade = QUsuario.usuario;
		return entidade.status.eq(status);
	}

	/**
	 * @param email E-mail a ser validado
	 * @return {@link Predicate}
	 */
	public static Predicate buscarPorEmail(String email) {
		QUsuario entidade = QUsuario.usuario;
		return entidade.email.eq(email);
	}
	
	/**
	 * Método que verificar se o e-mail é igual e se a id é diferente da que a informada
	 * 
	 * @param email E-mail a ser validado
	 * @param id Chave primária do registro a ser verificado
	 * @return {@link Predicate}
	 */
	public static Predicate buscarPorEmailEIDNaoIgual(String email, Long id) {
		QUsuario entidade = QUsuario.usuario;
		return entidade.email.eq(email).and(entidade.id.ne(id));
	}
	
	/**
	 * @param login usuário de acesso
	 * @return {@link Predicate}
	 */
	public static Predicate buscarPorLogin(String login) {
		QUsuario entidade = QUsuario.usuario;
		return entidade.login.eq(login);
	}
	
	/**
	 * Método que verificar se o login é igual e se a id é diferente da que a informada
	 * 
	 * @param login Login a ser validado
	 * @param id Chave primária do registro a ser verificado
	 * @return {@link Predicate}
	 */
	public static Predicate buscarPorLoginEIDNaoIgual(String login, Long id) {
		QUsuario entidade = QUsuario.usuario;
		return entidade.login.eq(login).and(entidade.id.ne(id));
	}

	/**
	 * @param filtro {@link KendoDataSource}
	 * @return {@link Predicate}
	 */
	public static Predicate pesquisarPorComponenteKendo(KendoDataSource filtro) {
		QUsuario entidade = QUsuario.usuario;
		
		BooleanExpression condicao = entidade.status.eq(Boolean.TRUE);
		
		if(filtro.getFilter() != null) {			Filtro filtroLocal = filtro.getFilter();
			List<Filtro> filtros = filtroLocal.getFilters();
			for (Filtro filtro2 : filtros) {
				String nomeOuEmail = filtro2.getValue();
				condicao = condicao.and(entidade.nome.startsWithIgnoreCase(nomeOuEmail)).or(entidade.email.startsWithIgnoreCase(nomeOuEmail));
			}
		}
		return condicao;
	}

	/**
	 * @param text String 
	 * @return {@link Predicate} 
	 */
	public static Predicate buscarPorNomeOuEmail(String text) {
		QUsuario entidade = QUsuario.usuario;
		return entidade.nome.startsWithIgnoreCase(text).or(entidade.email.startsWithIgnoreCase(text));
		
	}

}
