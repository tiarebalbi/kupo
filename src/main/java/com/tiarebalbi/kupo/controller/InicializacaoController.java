package com.tiarebalbi.kupo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * 
 * 
 * @author Tiarê Balbi Bonamini
 * @package com.tiarebalbi.kupo.controller
 * @since 1.0.0
 * 
 */
@Controller
@RequestMapping("/")
public class InicializacaoController extends AbstractClienteController {

	private static final String VIEW_INDEX = "inicializacao/index";
	
	@Autowired
	private SimpMessagingTemplate template;
	
	/**
	 * @return {@link ModelAndView}
	 *  
	 */
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView view = new ModelAndView(VIEW_INDEX);
		template.convertAndSend("/topic/greetings", "dawdaw");
		return view;
	}
	
	/**
	 * @return {@link ModelAndView}
	 *  
	 */
	@RequestMapping(method=RequestMethod.GET, value="/test")
	public ModelAndView sample() {
		ModelAndView view = new ModelAndView(VIEW_INDEX);
		template.convertAndSend("/topic/greetings", "Loading the url test from user");
		return view;
	}
}