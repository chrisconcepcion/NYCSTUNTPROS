"use strict";

describe("Controller: CreditMainCtrl", function(){
	var $scope;
	var rootScope;
	var Credit;
	var CreditCtrl;
	var suceedPromise;
	var timeout;
	
	beforeEach(module('profileUpdate'));
	
	beforeEach(inject(function($controller, $timeout, $q, $rootScope){
		timeout = $timeout;
		$scope = $rootScope.$new();
		rootScope = $rootScope;
		Credit = jasmine.createSpyObj('Credit', ['create', 'all']);
		Credit.all.andReturn([])
		Credit.create.andCallFake(function(){
			if ( suceedPromise ) {
				return $q.when("success!")
			} else {
				return $q.reject("Something must have went wrong.")
			}
		});
		CreditCtrl = $controller('CreditMainCtrl', {
			$scope: $scope,
			Credit: Credit
		});
	}))
	
	describe("Range", function() {
		describe("With Valid Input", function() {
			it('returns 3 items items', function() {
				var things = $scope.range(1,3);
				expect(things.length).toBe(3);
			});
			it('lists numbers in sequential order', function() {
				var things = $scope.range(1,3);
				expect(things).toEqual([1,2,3]);
			});
		});
		describe("With invalid Input", function(){
			it('returns an empty array', function() {
				var things = $scope.range(3,2);
				expect(things).toEqual([]);
			});
		});
	});	
	describe("Create", function(){
		describe("when successful", function(){
			it("calls Credit.create", function(){
				suceedPromise = true;
				$scope.create();
				expect(Credit.create).toHaveBeenCalled();
			});
			it("sets $scope.alert", function(){
				suceedPromise = true;
				$scope.create();
				$scope.$digest();
				expect($scope.alert).toBe("You have added a new credit.");
			});
			it("sets $scope.alert to false after timeout persists", function(){
				suceedPromise = true;
				$scope.create();
				$scope.$digest();
				timeout.flush();
				expect($scope.alert).toBe(false);
			});
		});
		describe("when unsuccessful", function(){
			it("calls Credit.create", function(){
				suceedPromise = false;
				$scope.create();
				expect(Credit.create).toHaveBeenCalled();
			});
			it("sets $scope.error", function(){
				suceedPromise = false;
				$scope.create();
				$scope.$digest();
				expect($scope.error).toBe("Something must have went wrong.");
			});
			it("sets $scope.error to false after timeout persists", function(){
				suceedPromise = false;
				$scope.create();
				$scope.$digest();
				timeout.flush();
				expect($scope.error).toBe(false);
			});
		});		
	});
});