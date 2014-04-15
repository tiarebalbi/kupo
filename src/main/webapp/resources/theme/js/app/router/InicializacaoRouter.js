define(["jquery","backbone", "js/app/view/InicializacaoView"], function($, Backbone, InicializacaoView){
	var InicializacaoRouter = Backbone.Router.extend({
		routes : {
			"" : "list",
			"home" : "list",
			"empresa/:id" : "empresa",
			"nova" : "novaEmpresa"
				
		},
		initialize : function () {
			
		},
		list : function () {
			var view = new InicializacaoView();
			view.render();
			this.navigate("home");
		}
	});
	
	return InicializacaoRouter;
});

