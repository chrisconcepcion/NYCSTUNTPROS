angular.module("profileUpdate").controller "ContactCtrl",[
	"$scope"
	"$routeParams"
	"Contact"
	"$rootScope"
	"$timeout"
	($scope,$routeParams,Contact,$rootScope, $timeout) ->
		$rootScope.$on "$routeChangeSuccess", ->
			$scope.contact = Contact.show($routeParams.id)
			return
		$scope.update = ->
			promise = Contact.update(id: $routeParams.id, contact: $scope.contact)
			promise.then((success) ->
				$scope.alert = success
				$timeout ->
					$scope.alert = false
				, 5000
			,(error) ->
				$scope.error = error
				$timeout ->
					$scope.error = false
				, 5000)
]
