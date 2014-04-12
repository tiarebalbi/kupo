package com.tiarebalbi.kupo.models;

import javax.persistence.Entity;
import javax.persistence.MappedSuperclass;
import javax.persistence.Version;

/**
 * {@link Entity} base para mapeamento com atributos de versão
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.models
 * @since 1.0.0
 * 
 */
@MappedSuperclass
public abstract class BaseEntity {
	
	/**
	 * @return {@link Long}
	 */
	public abstract Long getId();
	
	@Version
	protected Integer version;

	/**
	 * @return Integer versão do registro
	 */
	public Integer getVersion() {
		return version;
	}

	/**
	 * @param version versão
	 */
	public void setVersion(Integer version) {
		this.version = version;
	}
	
}
