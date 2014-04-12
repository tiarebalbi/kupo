package com.tiarebalbi.kupo.exceptions;


/**
 * Todas as exceptions referente a camada de persistencia
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.exceptions
 * @since 1.0.0
 * 
 */
public class KupoPersistenceException extends Exception {
	
	private String chave;

	private Object[] params;

	/**
	 * 
	 */
	private static final long serialVersionUID = -7042668424935363791L;
	
	/**
	 * Construtor com a mensagem do erro
	 * @param chave chave de acesso a mensagem sobre o erro gerado
	 */
	public KupoPersistenceException(String chave) {
		super(chave);
	}
	
	/**
	 * Construtor com a mensagem do erro
	 * @param chave chave de acesso a mensagem sobre o erro gerado
	 * @param params Lista de parâmetros a serem integrado na mensagem de erro
	 */
	public KupoPersistenceException(String chave, Object... params) {
		super(chave);
		this.params = params;
		this.chave = chave;
	}
	
	/**
	 * @return String chave
	 */
	public String getChave() {
		return chave;
	}
	
	/**
	 * @return Object...
	 */
	public Object[] getParams() {
		return params;
	}
}