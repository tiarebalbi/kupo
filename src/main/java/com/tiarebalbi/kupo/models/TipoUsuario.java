package com.tiarebalbi.kupo.models;

/**
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.models
 * @since 1.0.0
 * 
 */
public enum TipoUsuario {

	/**
	 * Assinante é o usuário que contratou o serviço ou seja possui permissão de configuração e visualização das informações geradas dentro do projeto.
	 */
	ASSINANTE("ROLE_ASSINANTE", "Assinante"),
	/**
	 * Administrador do sistema
	 */
	ROOT("ROLE_ROOT", "Administrador do Sistema"), 
	/**
	 * Tipo de usuário FUNCIONARIO, ou seja usuário que esta alocado como membro de uma empresa 
	 */
	FUNCIONARIO("ROLE_FUNCIONARIO", "Funcionário");
	
	
	private String role;
	private String nome;

	private TipoUsuario(String role, String nome) {
		this.role = role;
		this.nome = nome;
	}
	
	/**
	 * @return String
	 */
	public String getNome() {
		return nome;
	}
	
	/**
	 * @return String regra
	 */
	public String getRole() {
		return role;
	}
}
