package com.tiarebalbi.kupo.editor;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.propertyeditors.PropertiesEditor;

import com.tiarebalbi.kupo.models.Usuario;
import com.tiarebalbi.kupo.repository.predicate.UsuarioPredicate;
import com.tiarebalbi.kupo.service.UsuarioService;

/**
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.editor
 * @since 1.0.0
 * 
 */
public class UsuarioEditor extends PropertiesEditor {
	
	private UsuarioService service;
	
	/**
	 * @param service {@link UsuarioService}
	 */
	public UsuarioEditor(UsuarioService service) {
		this.service = service;
	}

	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		super.setAsText(text);
		
		if(StringUtils.isNumeric(text)) {
			Long id = new Long(text);
			Usuario registro = this.service.buscarRegistro(id);
			setValue(registro);
		}else {
			Usuario registro = this.service.buscarRegistro(UsuarioPredicate.buscarPorNomeOuEmail(text));
			setValue(registro);
		}
	}
}
