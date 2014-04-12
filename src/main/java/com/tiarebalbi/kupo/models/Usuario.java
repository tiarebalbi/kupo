package com.tiarebalbi.kupo.models;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.cache.annotation.Cacheable;

/**
 * Entidade de usuário
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.models
 * @since 1.0.0
 * 
 */
@Entity
@Cacheable(value = "usuario_entity", key="#login + #email + #id")
public class Usuario extends BaseEntity implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -1282754876163818229L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
	
	@NotEmpty
	private String nome;
	
	@NotEmpty
	private String sobrenome;
	
	@Column(unique=true)
	private String email;
	
	@Column(unique=true)
	private String login;
	
	private String senha;
	
	private Boolean status;
	
	@Enumerated(EnumType.STRING)
	private TipoUsuario tipo;
	
	@Enumerated(EnumType.STRING)
	private TipoIdioma idioma;
	
	/**
	 * @return the sobrenome
	 */
	public String getSobrenome() {
		return sobrenome;
	}

	/**
	 * @param sobrenome the sobrenome to set
	 */
	public void setSobrenome(String sobrenome) {
		this.sobrenome = sobrenome;
	}

	/**
	 * @return the idioma
	 */
	public TipoIdioma getIdioma() {
		return idioma;
	}

	/**
	 * @param idioma the idioma to set
	 */
	public void setIdioma(TipoIdioma idioma) {
		this.idioma = idioma;
	}

	@Override
	public Long getId() {
		return this.id;
	}
	
	/**
	 * Construtor inicial
	 */
	public Usuario() {
		super();
	}
	
	/**
	 * @param nome Nome do usuário
	 * @param email email do usuário
	 * @param login usuário de acesso
	 * @param senha senha de acesso
	 * @param status status do usuário
	 * @param tipo tipo de usuário
	 */
	public Usuario(String nome, String email, String login, String senha,
			Boolean status, TipoUsuario tipo) {
		super();
		this.nome = nome;
		this.email = email;
		this.login = login;
		this.senha = senha;
		this.status = status;
		this.tipo = tipo;
	}

	/**
	 * @param id chave primária
	 */
	public void setId(Long id) {
		this.id = id;
	}

	/**
	 * @return the nome
	 */
	public String getNome() {
		return nome;
	}

	/**
	 * @param nome the nome to set
	 */
	public void setNome(String nome) {
		this.nome = nome;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the login
	 */
	public String getLogin() {
		return login;
	}

	/**
	 * @param login the login to set
	 */
	public void setLogin(String login) {
		this.login = login;
	}

	/**
	 * @return the senha
	 */
	public String getSenha() {
		return senha;
	}

	/**
	 * @param senha the senha to set
	 */
	public void setSenha(String senha) {
		this.senha = senha;
	}

	/**
	 * @return the status
	 */
	public Boolean getStatus() {
		return status;
	}

	/**
	 * @param status the status to set
	 */
	public void setStatus(Boolean status) {
		this.status = status;
	}

	/**
	 * @return the tipo
	 */
	public TipoUsuario getTipo() {
		return tipo;
	}

	/**
	 * @param tipo the tipo to set
	 */
	public void setTipo(TipoUsuario tipo) {
		this.tipo = tipo;
	}
	
}
