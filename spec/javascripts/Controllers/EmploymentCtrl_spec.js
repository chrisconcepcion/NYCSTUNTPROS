"use strict";

describe("Controller: EmploymentCtrl", function(){
	var EmploymentCtrl;
	var $scope;
	var Employment;
	var rootScope;
	var succeedPromise;
	var timeout;
	
	beforeEach(module('profileUpdate'));	

	beforeEach(inject(function ($controller, $rootScope, $q, $timeout) {
		timeout = $timeout;
		$scope = $rootScope.$new();
		rootScope = $rootScope;
		Employment = jasmine.createSpyObj('Employment', ['update', 'show'])
	 	Employment.update.andCallFake(function(){
        if (succeedPromise) {
            return $q.when("success!");
        }
        else{
            return $q.reject("Something went wrong");
        }
    });
		Employment.show.andReturn("el oh el");			
		EmploymentCtrl = $controller('EmploymentCtrl', {
			$scope: $scope,
			Employment: Employment
		});
	}))
	
	describe("When page loads", function(){
		it('Employment.show is called', function() {
			var objToMockCurrentRoute = {
  			pathParams: {
    			id: "MY_ID"
  			}
			}
			rootScope.$broadcast('$routeChangeSuccess', objToMockCurrentRoute);
			$scope.$apply()
			expect(Employment.show).toHaveBeenCalled();
		});
	});
	describe("Update", function() {
		describe("when successful", function(){
			it('calls update', function() {
				succeedPromise = true;
				$scope.update()
				$scope.$digest();
				expect(Employment.update).toHaveBeenCalled();
			});
			it('sets scope.alert', function() {
				succeedPromise = true;
				$scope.update()
				$scope.$digest();
				expect($scope.alert).toBe("success!");
			});
			it('sets scope.alert to false after timeout resolves', function() {				
				succeedPromise = true;
				$scope.update()
				$scope.$digest();
				timeout.flush();
				expect($scope.alert).toBe(false);
			});
		});
		describe("when unsuccessful", function(){
			it('calls update', function() {
				succeedPromise = false;
				$scope.update()
				$scope.$digest();
				expect(Employment.update).toHaveBeenCalled();
			});
			it('sets scope.error', function() {
				succeedPromise = false;
				$scope.update()
				$scope.$digest();
				expect($scope.error).toBe("Something went wrong");
			});
			it('sets scope.error to false after timeout resolves', function() {				
				succeedPromise = false;
				$scope.update()
				$scope.$digest();
				timeout.flush();
				expect($scope.error).toBe(false);
			});
		});
	});
});