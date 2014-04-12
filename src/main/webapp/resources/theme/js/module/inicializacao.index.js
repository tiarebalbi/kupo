define(["jquery","backbone", "core", "js/app/router/InicializacaoRouter"], function($, Backbone, core,InicializacaoRouter){
	var router = new InicializacaoRouter();
	Backbone.history.start();
	return router;
});