package com.tiarebalbi.kupo.models;

/**
 * Lista de idiomas disponível no sistema
 * 
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.models
 * @since 1.0.0
 * 
 */
public enum TipoIdioma {
	
	/**
	 * 
	 */
	INGLES("English", "en_US"),
	/**
	 * Espanhol 
	 */
	SPAIN("Espanhol", "es_ES"),
	
	/**
	 * Espanhol 
	 */
	CHINES("Chinês", "cn"),
	/**
	 * 
	 */
	PORTUGUES ("Português", "pt_BR");
	
	private String nome;
	private String sigla;

	private TipoIdioma(String nome, String sigla) {
		this.nome = nome;
		this.sigla = sigla;
	}

	/**
	 * @return String nome do idioma
	 */
	public String getNome() {
		return nome;
	}
	
	/**
	 * @return String sigla do idioma
	 */
	public String getSigla() {
		return sigla;
	}
}
