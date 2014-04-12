package com.tiarebalbi.kupo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tiarebalbi.kupo.exceptions.KupoPersistenceException;
import com.tiarebalbi.kupo.models.TipoIdioma;
import com.tiarebalbi.kupo.models.TipoUsuario;
import com.tiarebalbi.kupo.models.Usuario;
import com.tiarebalbi.kupo.service.UsuarioService;

/**
 * Controller para gerenciamento de acesso ao sistema
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.controller
 * @since 1.0.0
 * 
 */
@Controller
@RequestMapping("/login")
public class LoginController {

	private static final String VIEW_INDEX = "login/index";
	private static final String VIEW_RECUPERAR_SENHA = "login/recuperar-senha";
	private static final String REDIRECT_TO_INDEX = "redirect:/login";
	
	@Autowired
	private UsuarioService usuarioService;

	/**
	 * Método para view de autenticação
	 * @param request {@link HttpServletRequest}
	 * @param response {@link HttpServletResponse}
	 * 
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value="")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView view = new ModelAndView(VIEW_INDEX);
		
		String msg = (String) request.getAttribute("error-msg");
		view.addObject("errorMessage", msg);
		Object attribute = request.getParameter("kupo_username");
		view.addObject("kupo_username", attribute);
		return view;
	}
	
	/**
	 * Método para view de autenticação
	 * 
	 * @return {@link ModelAndView}
	 */
	@RequestMapping(value="/recover-password", method=RequestMethod.GET)
	public ModelAndView recuperarSenha() {
		ModelAndView view = new ModelAndView(VIEW_RECUPERAR_SENHA);
		return view;
	}
	
	/**
	 * Método para view de autenticação
	 * 
	 * @return {@link ModelAndView}
	 * @throws KupoPersistenceException Persistence Exception 
	 */
	@RequestMapping(value="/install", method=RequestMethod.GET)
	public ModelAndView install() throws KupoPersistenceException {
		ModelAndView view = new ModelAndView(REDIRECT_TO_INDEX);
		
		Usuario usuario = new Usuario();
		usuario.setEmail("tiarebalbi@Me.com");
		usuario.setLogin("tiare");
		usuario.setSenha("481200");
		usuario.setNome("Tiare");
		usuario.setSobrenome("Balbi");
		usuario.setVersion(new Integer(1));
		usuario.setIdioma(TipoIdioma.PORTUGUES);
		usuario.setTipo(TipoUsuario.ROOT);
		usuario.setStatus(Boolean.TRUE);
		
		this.usuarioService.salvar(usuario);
		
		return view;
	}
	
}
