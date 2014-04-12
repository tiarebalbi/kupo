'use strict';

// Keen.io Configuration
var Keen=Keen||{configure:function(e){this._cf=e;},addEvent:function(e,t,n,i){this._eq=this._eq||[],this._eq.push([e,t,n,i]);},setGlobalProperties:function(e){this._gp=e;},onChartsReady:function(e){this._ocrq=this._ocrq||[],this._ocrq.push(e);}};(function(){var e=document.createElement("script");e.type="text/javascript",e.async=!0,e.src=("https:"==document.location.protocol?"https://":"http://")+"dc8na2hxrj29i.cloudfront.net/code/keen-2.1.0-min.js";var t=document.getElementsByTagName("script")[0];t.parentNode.insertBefore(e,t);})();
Keen.configure({
    projectId: "xxxxx",
    writeKey: "xxxx",
    readKey: "xxxx"  
});

var Kupo = new Object();
Kupo.version = "1.0.0";
Kupo.params = {
	baseUrl: $("body").data("link"),
	userName : $("body").data("cache-name"),
	lang : $("body").data("language")
};
Kupo.fnc = {
	getBaseUrl : function () {
		return Kupo.params.baseUrl;
	},
	getVersion : function () {
		return Kupo.version;
	},
	getLang : function () {
		return Kupo.params.lang.replace("_","-");
	},
	buildUrl : function (url) {
		return Kupo.params.baseUrl + url;
	},
	parseInput : function (element)  {
		var $inputs = new Object();
		$(element).find("input, select, textarea").each(function (indice, item) {
			var val = $(item);
			if(val.is(':radio')) {
				$inputs[val.prop("name")] = val.filter(":checked").val();
			}else {
				$inputs[val.prop("name")] = val.val();
			}
		});
		return $inputs;
	},
	badget : function (type, value) {
		return '<div class="badge badge-'+type+' notification" style="margin-bottom: 10px;">'+value+'</div>';
	}
};

// Require.js Configuration
if (typeof require != 'undefined') {
	require.config({
		baseUrl : $("body").data("path"),
		paths : {
			
			// Default theme
			jquery : 'plugins/jquery-1.8.3.min',
			datejs : 'plugins/datejs/date',
			backbone : "plugins/backbone/backbone-min",
			underscore : "plugins/backbone/underscore-min",
			core : "js/vendor/core",
			chat : "js/vendor/chat",
			
			// Custom by theme
			jqueryUi : "plugins/jquery-ui/jquery-ui-1.10.1.custom.min",
			bootstrap : "plugins/boostrapv3/js/bootstrap.min",

			// Backbone Application
			handlebars : "plugins/backbone/handlebars-v1.2.0",
			i18n : "plugins/i18n/polyglot.min",
			internationalization : "plugins/i18n/const",
			paginator : "plugins/backbone/backbone.paginator.min",
			syphon: "plugins/backbone/backbone.syphon.min",
			
			// Socket
			sockjs: "plugins/sockjs/sockjs.min",
			stomp: "plugins/stomp/lib/stomp.min",
			
			// UI
			kendo : "plugins/kendo/js/kendo.all.min",
		},
		shim: {
			backbone : {
				deps : ["jquery", "underscore"],
				exports : "Backbone"
			},
			paginator : {
				deps : ["jquery","backbone"],
				exports : "paginator"
			},
			core : {
				deps : ["jqueryUi", "bootstrap",
				        "plugins/breakpoints", "plugins/jquery-unveil/jquery.unveil.min", 
				        "plugins/pace/pace.min", 'plugins/jquery-block-ui/jqueryblockui',
				        "plugins/jquery-slider/jquery.sidr.min", "plugins/jquery-numberAnimate/jquery.animateNumbers",
				        "plugins/jquery-slimscroll/jquery.slimscroll.min"]
			},
			handlebars : {
				deps : ["backbone", "underscore"],
				exports : "Handlebars"
			},
			sockjs : {
				exports : "SockJS"
			},
			stomp : {
				exports : "Stomp"
			},
			i18n : {
				exports : "Polyglot"
			},
			internationalization : {
				deps : ["i18n"],
				exports : "polyglot"
			},
			kendo : {
				deps : ["jquery", "plugins/kendo/js/cultures/kendo.culture." + Kupo.fnc.getLang() + ".min"]
			}
		}
	});
}