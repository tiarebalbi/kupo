define(["jquery","backbone","internationalization","sockjs", "stomp"], function($, Backbone, polyglot, SockJS, Stomp){

	var InicializacaoView = Backbone.View.extend({
		el : $(".dynamic-content"),
		/**
		 * Construtor da view
		 */
		initialize: function(model) {
			
//			 Inicializando socket
			var socket = new SockJS('/kupo/application'); // <!-- My endpoint
	        var stompClient = Stomp.over(socket);
	        
	        stompClient.connect({}, function(frame) {
	        	var username = frame.headers['user-name'];
	        	stompClient.send('/topic/greetings',{}, "Disconnect: " + username);
	        });
	        stompClient.connect({}, function(frame) {
	        	
	        	var username = frame.headers['user-name'];
	        	$("#log").append("<br/>");
	        	$("#log").append("User connected: " + username );
	        	stompClient.send('/topic/greetings',{}, "New User connected: " + username);
	        	
	        	stompClient.subscribe("/topic/greetings", function(message) { // <-- Topic where I want to send the message
	        		$("#log").append("<br/>");
	                $("#log").append("Message: " + message.body);
	            });
	        	
	        } , function(error) {
	            $("#log").append("Error : " + message);
	        });
	        
		
		},
		render : function () {
			return ;
		}
		
	});

	
	return InicializacaoView;
});