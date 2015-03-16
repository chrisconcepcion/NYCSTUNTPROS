angular.module("profileUpdate").controller "ProfileCtrl", [
	"$scope"
	"$routeParams"
	"Profile"
	"$route"
	"$rootScope"
	"$timeout"
	($scope,$routeParams,Profile,$route,$rootScope,$timeout) -> 
		$rootScope.$on "$routeChangeSuccess", ->
			$scope.profile = Profile.show($routeParams.id)
			return
		$scope.range = (min, max) ->
  		step = 1
  		input = []
  		i = min
  		while i <= max
    		input.push i
    		i += step
  		input
		$scope.update = ->
			promise = Profile.update($scope.profile)
			promise.then((success) ->
				$scope.alert = success
				$timeout ->
					$scope.alert = false
				, 5000
			,(err) ->
				$scope.error = err
				$timeout ->
					$scope.error = false
				, 5000)
				
]