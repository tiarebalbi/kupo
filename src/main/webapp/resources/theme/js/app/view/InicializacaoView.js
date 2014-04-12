define(["jquery","backbone","internationalization","sockjs", "stomp"], function($, Backbone, polyglot, SockJS, Stomp){

	var InicializacaoView = Backbone.View.extend({
		el : $(".dynamic-content"),
		events : {
			// CRUD
			"click .reload" : "findAll",
			"click .new-company" : "novaEmpresa"
		},
		/**
		 * Construtor da view
		 */
		initialize: function(model) {
			
//			 Inicializando socket
			var socket = new SockJS('/kupo/application'); // <!-- My endpoint
	        var stompClient = Stomp.over(socket);
	        stompClient.connect({}, function(frame) {
	        	
	        	var username = frame.headers['user-name'];
	        	console.log("User connected: " + username);
	        	
	        	stompClient.subscribe("/topic/greetings", function(message) { // <-- Topic where I want to send the message
	                console.log("TOPIC:",message);
	            });
	        	
	        } , function(error) {
	            console.log("STOMP protocol error " + error);
	        });
	        
		
		},
		render : function () {
			return ;
		}
		
	});

	
	return InicializacaoView;
});