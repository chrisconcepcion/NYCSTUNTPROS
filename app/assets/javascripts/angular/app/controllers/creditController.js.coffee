angular.module("profileUpdate").controller "CreditMainCtrl",[
	"$scope"
	"Credit"
	"$timeout"
	($scope,Credit,$timeout) ->
		$scope.entries = Credit.all()
		$scope.end_year = new Date().getFullYear()
		$scope.start_year = new Date().getFullYear() - 80
		$scope.active = true
		$scope.range = (min, max, step) ->
			step = (if (step is `undefined`) then 1 else step)
			input = []
			i = min
			while i <= max
    		input.push i
    		i += step
  		input
		$scope.addCreditButton = true
		$scope.newCredit = ->
			$scope.addCreditButton = false
			$scope.newCreditForm = true
		$scope.cancelNewCredit = ->
			$scope.addCreditButton = true
			$scope.newCreditForm = false
			$scope.newEntry = {}
		$scope.create = ->
			promise = Credit.create($scope.newEntry)
			promise.then((success) ->
				$scope.entries.push(success)
				$scope.alert = "You have added a new credit."
				$timeout ->
					$scope.alert= false
				, 5000
				$scope.cancelNewCredit()
			, (error) ->
				$scope.error = error
				$timeout ->
					$scope.error = false
				, 5000)
]


angular.module("profileUpdate").controller "CreditCtrl",[
	"$scope"
	"Credit"
	"$timeout"
	($scope,Credit,$timeout) ->
		$scope.edit = false
		$scope.range = (min, max, step) ->
			step = (if (step is `undefined`) then 1 else step)
			input = []
			i = min
			while i <= max
    		input.push i
    		i += step
  		input
		$scope.destroy = (credit) ->
			promise = Credit.destroy(credit)
			promise.then((success) ->
				$scope.showCredit = false
				idx = $scope.entries.indexOf(credit)
				$scope.entries.splice(idx, 1)
			, (error) ->)
		$scope.update = (credit) ->
			promise = Credit.update(credit)
			promise.then((success) ->
				$scope.creditUpdateSuccessMsg = "You have successfully updated your credit."
				$timeout -> 
						$scope.creditUpdateSuccessMsg = false
					, 5000
				$scope.cancelEdit()
			, (errorMsg) ->
				$scope.creditUpdateFailMsg = errorMsg
				$timeout ->
					$scope.creditUpdateFailMsg = false
				, 5000
				$scope.cancelEdit())
			return
		$scope.editEntry = ->
    	$scope.edit = true
    	return
  	$scope.cancelEdit = ->
    	$scope.edit = false
    	return
]