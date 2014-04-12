define(["jquery", "i18n"], function($, Polyglot){
	
	var idioma = $("body").data("language");
	var link = $("body").data("link");
	var url = link + "/resources/theme/js/app/i18n/" + idioma + ".json";
	var polyglot = new Polyglot({locale : idioma});

	$.getJSON(url , function( data ) {
		polyglot.extend(data);
	});
	
	return polyglot;
});