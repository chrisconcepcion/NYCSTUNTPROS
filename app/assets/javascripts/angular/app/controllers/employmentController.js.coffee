angular.module("profileUpdate").controller "EmploymentCtrl",[
	"$scope"
	"$routeParams"
	"Employment"
	"$rootScope"
	"$timeout"
	($scope,$routeParams,Employment,$rootScope, $timeout) ->
		$rootScope.$on "$routeChangeSuccess", ->
			$scope.employment = Employment.show($routeParams.id)
			return
		$scope.update = ->
			promise = Employment.update($scope.employment)
			promise.then((success) ->
				$scope.alert = success
				$timeout ->
					$scope.alert = false
				, 5000
			,(error) ->
				$scope.error = error
				$timeout ->
					$scope.error= false
				, 5000)
]
