"use strict";

describe("Controller: ContactCtrl", function(){
	var ContactCtrl;
	var $scope;
	var Contact;
	var rootScope;
	var succeedPromise;
	var timeout;
	
	beforeEach(module('profileUpdate'));	

	beforeEach(inject(function ($controller, $rootScope, $q, $timeout) {
		timeout = $timeout;
		$scope = $rootScope.$new();
		rootScope = $rootScope;
		Contact = jasmine.createSpyObj('Contact', ['update', 'show'])
	 	Contact.update.andCallFake(function(){
        if (succeedPromise) {
            return $q.when("success!");
        }
        else{
            return $q.reject("Something went wrong");
        }
    });
		Contact.show.andReturn("el oh el");			
		ContactCtrl = $controller('ContactCtrl', {
			$scope: $scope,
			Contact: Contact
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
			expect(Contact.show).toHaveBeenCalled();
		});
	});
	describe("Update", function() {
		describe("when successful", function(){
			it('calls update', function() {
				succeedPromise = true;
				$scope.update()
				$scope.$digest();
				expect(Contact.update).toHaveBeenCalled();
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
				expect(Contact.update).toHaveBeenCalled();
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