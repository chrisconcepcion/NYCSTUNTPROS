app = angular.module("Credits", ["ngResource"])

@CreditsCtrl =($scope, $resource) ->
	Credit = $resource("/credits/:id.json", {id: @id}, 'update': {method: 'PATCH', params: {id: '@id'}, headers: {'Content-Type': 'application/json'}}, 'delete': {method: 'DELETE', headers: {'Content-Type': 'application/json'}})
	
	$scope.entries = Credit.query()
	$scope.end_year = new Date().getFullYear()
	$scope.start_year = new Date().getFullYear() - 80
	$scope.active = true
	$scope.edit = false
	$scope.range = (min, max, step) ->
  	step = (if (step is `undefined`) then 1 else step)
  	input = []
  	i = min
  	while i <= max
    	input.push i
    	i += step
  	input
	$scope.createEntry = ->
		credit = Credit.save($scope.newEntry)
		$scope.entries.push($scope.newEntry)
		$scope.newEntry = {}
	$scope.deleteEntry = (id, idx) ->
    $scope.active = false
    Credit["delete"] id: id
    return
	$scope.editEntry = ->
    $scope.active = false
    $scope.edit = true
    return
  $scope.cancelEdit = ->
    $scope.edit = false
    $scope.active = true
    return
	$scope.updateEntry = (id, idx) ->
		$scope.edit = false
		$scope.active = true
		$scope.entries[idx] = $scope.entry
		Credit["update"] $scope.entries[idx]
		return
		
