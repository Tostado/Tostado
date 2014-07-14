(function(){
var app = angular.module('CollabNets', ['uiSlider']);
var item1 = {cost:0};
var prof1 = {name:"", email:"", uri:""};

app.controller('CNController', function(){
	this.item = item1;
	this.step = 0;
	this.prof = prof1;
	
	this.selectStep = function(setStep) {
		this.step = setStep;
	};
	
	this.searchUser = function() {
		// TODO: Fetch user URI;
		this.prof.name = "Hector G. Ceballos";
		this.prof.uri = "uri";
		this.step = 2;
	};
});



})();