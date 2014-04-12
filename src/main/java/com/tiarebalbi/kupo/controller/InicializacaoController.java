package com.tiarebalbi.kupo.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
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
	
	/**
	 * @return {@link ModelAndView}
	 *  
	 */
	@RequestMapping(method=RequestMethod.GET)
	public ModelAndView index() {
		ModelAndView view = new ModelAndView(VIEW_INDEX);
		return view;
	}
	
	
	/**
	 * @param message {@link HelloMessage}
	 * @return {@link Greeting}
	 * @throws Exception a
	 */
	@MessageMapping("/hello")
    @SendTo("/topic/greetings")
    public Greeting greeting(HelloMessage message) throws Exception {
        Thread.sleep(3000); // simulated delay
        return new Greeting("Hello, " + message.getName() + "!");
    }
	
}