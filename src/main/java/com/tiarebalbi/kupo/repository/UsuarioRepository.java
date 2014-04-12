package com.tiarebalbi.kupo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QueryDslPredicateExecutor;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.tiarebalbi.kupo.models.Usuario;

/**
 * Integração dos métodos {@link JpaRepository} e {@link QueryDslPredicateExecutor}
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.repository
 * @since 1.0.0
 * 
 */
@Repository
@Transactional
public interface UsuarioRepository  extends JpaRepository<Usuario, Long>, QueryDslPredicateExecutor<Usuario>  {

}