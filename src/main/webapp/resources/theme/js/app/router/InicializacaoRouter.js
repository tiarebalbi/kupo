define(["jquery","backbone", "js/app/collection/EmpresaCollection", "js/app/view/InicializacaoView", "js/app/model/Empresa"], function($, Backbone, EmpresaCollection, InicializacaoView, Empresa){
	var InicializacaoRouter = Backbone.Router.extend({
		routes : {
			"" : "list",
			"home" : "list",
			"empresa/:id" : "empresa",
			"nova" : "novaEmpresa"
				
		},
		initialize : function () {
			var funcionalidades = new EmpresaCollection();
			var self = this;
			self.collection = funcionalidades;
		},
		list : function () {
			var view = new InicializacaoView(this.collection);
			view.render();
			this.navigate("home");
		},
		novaEmpresa : function () {
			
			var view = new InicializacaoView(this.collection);
			view.render();
			view.novaEmpresa();
			this.navigate("home");
			
		},
		empresa: function (id) {
			var view = new InicializacaoView(this.collection);
			view.render();
			
			console.log("Chave",id);
		}
	});
	
	return InicializacaoRouter;
});

