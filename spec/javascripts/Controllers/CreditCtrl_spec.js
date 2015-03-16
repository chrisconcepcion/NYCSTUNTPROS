"use strict";

describe("controller: CreditCtrl", function(){
	var $scope;
	var rootScope;
	var timeout;
	var Credit;
	var CreditCtrl;
	var succeedPromise;
	
	beforeEach(module('profileUpdate'));

	beforeEach(inject(function($controller, $timeout, $q, $rootScope){
		timeout = $timeout;
		$scope = $rootScope.$new();
		rootScope = $rootScope;
		Credit = jasmine.createSpyObj("Credit", ["destroy", "update"]);
		Credit.update.andCallFake(function(){
			if (succeedPromise) {
				return $q.when("success!");
			} else {
				return $q.reject("Something went wrong.");
			}
		});
		Credit.destroy.andCallFake(function(){
			if ( succeedPromise ) {
				return $q.when("success!");
			} else {
				return $q.reject("Something went wrong.");
			}
		});
		CreditCtrl = $controller("CreditCtrl", {
			$scope: $scope,
			Credit: Credit
		});
	}));
	
	describe("Destroy", function(){
		describe("when successful", function(){
			it("calls Credit.destroy", function(){
				$scope.entries = ["item1"]
				succeedPromise = true;
				$scope.destroy($scope.entries[0]);
				$scope.$digest();
				expect(Credit.destroy).toHaveBeenCalled();
			});
			it("sets $scope.creditUpdateSucessMsg", function(){
				$scope.entries = ["item1"]
				succeedPromise = true;
				$scope.destroy($scope.entries[0]);
				$scope.$digest();
				expect($scope.entries[0]).toBe(undefined);
			});
		});
		describe("when unsuccessful", function(){
			it("calls Credit.destroy", function(){
				$scope.entries = ["item1"]
				succeedPromise = false;
				$scope.destroy($scope.entries[0]);
				$scope.$digest();
				expect(Credit.destroy).toHaveBeenCalled();
			});
		});
	});
	
	describe("Update", function(){
		describe("when successful", function(){
			it("calls Credit.update", function(){
				$scope.entries = ["item1"]
				succeedPromise = true;
				$scope.update($scope.entries[0]);
				$scope.$digest();
				expect(Credit.update).toHaveBeenCalled();
			});
			it("sets $scope.creditUpdateSuccessMsg", function(){
				$scope.entries = ["item1"]
				succeedPromise = true;
				$scope.update($scope.entries[0]);
				$scope.$digest();
				expect($scope.creditUpdateSuccessMsg).toBe("You have successfully updated your credit.")
			});
			it("sets $scope.creditUpdateSuccessMsg after timeout persists", function(){
				$scope.entries = ["item1"]
				succeedPromise = true;
				$scope.update($scope.entries[0]);
				$scope.$digest();
				timeout.flush();
				expect($scope.creditUpdateSuccessMsg).toBe(false)
			});
			it("sets $scope.edit", function(){
				$scope.entries = ["item1"]
				succeedPromise = true;
				$scope.update($scope.entries[0]);
				$scope.$digest();
				timeout.flush();
				expect($scope.edit).toBe(false)
			});
		});
		describe("when unsuccessful", function(){
			it("calls Credit.update", function(){
				$scope.entries = ["item1"]
				succeedPromise = false;
				$scope.update($scope.entries[0]);
				$scope.$digest();
				expect(Credit.update).toHaveBeenCalled();
			});
			it("sets $scope.creditUpdateFailMsg", function(){
				$scope.entries = ["item1"]
				succeedPromise = false;
				$scope.update($scope.entries[0]);
				$scope.$digest();
				expect($scope.creditUpdateFailMsg).toBe("Something went wrong.");
			});
			it("sets $scope.creditUpdateFailMsg after timeout persists", function(){
				$scope.entries = ["item1"]
				succeedPromise = false;
				$scope.update($scope.entries[0]);
				$scope.$digest();
				timeout.flush();
				expect($scope.creditUpdateFailMsg).toBe(false);
			});
			it("sets $scope.edit", function(){
				$scope.entries = ["item1"]
				succeedPromise = false;
				$scope.update($scope.entries[0]);
				$scope.$digest();
				timeout.flush();
				expect($scope.edit).toBe(false);
			});
		});
	});
});