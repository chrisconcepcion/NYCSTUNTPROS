
profileUpdate = angular.module("profileUpdate", ["profileUpdate","ngResource", "ngRoute", "ngAnimate"])



profileUpdate.config( ['$routeProvider', '$locationProvider', ($routeProvider, $locationProvider)->
	$routeProvider.when('/users/profiles/:id/edit', { controller: "ProfileCtrl"})
	$locationProvider.html5Mode(enabled: true, requireBase: false);
])
