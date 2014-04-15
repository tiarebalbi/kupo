package com.tiarebalbi.kupo.service.impl;

import java.util.concurrent.atomic.AtomicBoolean;

import javax.annotation.Resource;
import javax.validation.Valid;

import org.joda.time.LocalTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationListener;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.messaging.core.MessageSendingOperations;
import org.springframework.messaging.simp.broker.BrokerAvailabilityEvent;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.mysema.query.types.Predicate;
import com.tiarebalbi.kupo.commons.KupoMessage;
import com.tiarebalbi.kupo.configuration.security.KupoPasswordEncoder;
import com.tiarebalbi.kupo.exceptions.KupoPersistenceException;
import com.tiarebalbi.kupo.models.Usuario;
import com.tiarebalbi.kupo.repository.UsuarioRepository;
import com.tiarebalbi.kupo.repository.predicate.UsuarioPredicate;
import com.tiarebalbi.kupo.service.UsuarioService;

/**
 * Implementação da interface {@link UsuarioService}
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.service.impl
 * @since 1.0.0
 * 
 */
@Service
public class UsuarioServiceImpl implements UsuarioService, ApplicationListener<BrokerAvailabilityEvent> {

	@Resource
	private UsuarioRepository repository;
	
	@Autowired
	private KupoMessage message;
	
	private AtomicBoolean brokerAvailable = new AtomicBoolean();

	@Autowired
	private MessageSendingOperations<String> messagingTemplate;
	
	private final Logger LOGGER = LoggerFactory.getLogger(getClass());

	@Override
	public void onApplicationEvent(BrokerAvailabilityEvent event) {
	    this.brokerAvailable.set(event.isBrokerAvailable());
	}
	
	@Scheduled(fixedDelay=3000)
	public void testing() {
	    if (this.brokerAvailable.get()) {
	    	LOGGER.info("Running..." + LocalTime.now());
	        this.messagingTemplate.convertAndSend("/topic/greetings", "Testing....");
	    }
	}

	@Override
	public Page<Usuario> buscarTodos(PageRequest page) {
		return this.repository.findAll(page);
	}
	
	@Override
	public Page<Usuario> buscarTodos(PageRequest page, Predicate condicao) {
		return this.repository.findAll(condicao, page);
	}

	@Override
	public Usuario buscarRegistro(Long id) {
		return this.repository.findOne(id);
	}

	@Override
	public Usuario buscarRegistro(Predicate condicao) {
		return this.repository.findOne(condicao);
	}

	@Override
	public Usuario salvar(@Valid Usuario entidade) throws KupoPersistenceException {
		if (entidade == null) {
			throw new KupoPersistenceException(message.getMessage("validation.object.null"));
		}
		
		
		if(entidade.getId() == null) {
			
			// Verificando e-mail único
			Usuario email = this.repository.findOne(UsuarioPredicate.buscarPorEmail(entidade.getEmail()));
			if(email != null) {
				throw new KupoPersistenceException(message.getMessage("validation.object.email.nonunique", entidade.getEmail()));
			}
			
			// Verificando login único
			Usuario login = this.repository.findOne(UsuarioPredicate.buscarPorLogin(entidade.getLogin()));
			if(login != null) {
				throw new KupoPersistenceException(message.getMessage("validation.object.login.nonunique", entidade.getLogin()));
			}
		}else {
			// Verificando e-mail único quando atualizado o cadastro
			Usuario email = this.repository.findOne(UsuarioPredicate.buscarPorEmailEIDNaoIgual(entidade.getEmail(), entidade.getId()));
			if(email != null) {
				throw new KupoPersistenceException(message.getMessage("validation.object.email.nonunique", entidade.getEmail()));
			}
			
			// Verificando login único quando atualizado o cadastro
			Usuario login = this.repository.findOne(UsuarioPredicate.buscarPorLoginEIDNaoIgual(entidade.getLogin(), entidade.getId()));
			if(login != null) {
				throw new KupoPersistenceException(message.getMessage("validation.object.login.nonunique", entidade.getLogin()));
			}
		}
		

		if(entidade.getSenha() != null) {
			entidade.setSenha(new KupoPasswordEncoder().encode(entidade.getSenha()));
		}
		
		return this.repository.save(entidade);
	}

	@Override
	public Usuario excluir(Long id) throws KupoPersistenceException {
		Usuario entidade = this.buscarRegistro(id);
		
		if(entidade == null) {
			throw new KupoPersistenceException(message.getMessage("validation.object.null"));
		}
		
		this.repository.delete(id);
		return entidade;
	}

	@Override
	public Usuario excluir(Usuario entidade) throws KupoPersistenceException {
		
		if(entidade == null) {
			throw new KupoPersistenceException(message.getMessage("validation.object.null"));
		}
		
		this.repository.delete(entidade);
		return entidade;
	}

	@Override
	public Usuario authentication(Predicate condicao) {
		return this.repository.findOne(condicao);
	}

}
