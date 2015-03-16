"use strict";


describe('Controller: ProfileCtrl', function () {
	var ProfileCtrl;
	var $scope;
	var Profile;
	var rootScope;
	var succeedPromise;
	var timeout;
	//load the controller's module
	beforeEach(module('profileUpdate'));	
	
	
	
	beforeEach(inject(function ($controller, $rootScope, $q, $timeout) {
		timeout = $timeout;
		$scope = $rootScope.$new();
		rootScope = $rootScope;
		Profile = jasmine.createSpyObj('Profile', ['update', 'show'])
	 	Profile.update.andCallFake(function(){
        if (succeedPromise) {
            return $q.when("success!");
        }
        else{
            return $q.reject("Something went wrong");
        }
    });
		Profile.show.andReturn("el oh el");			
		ProfileCtrl = $controller('ProfileCtrl', {
			$scope: $scope,
			Profile: Profile
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
	describe("Update", function() {
		describe("when successful", function(){
			it('calls update', function() {
				succeedPromise = true;
				$scope.update()
				$scope.$digest();
				expect(Profile.update).toHaveBeenCalled();
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
				expect(Profile.update).toHaveBeenCalled();
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
	it('show test', function() {
		var objToMockCurrentRoute = {
  		pathParams: {
    		id: "MY_ID"
  		}
		}
		rootScope.$broadcast('$routeChangeSuccess', objToMockCurrentRoute);
		$scope.$apply()
		expect(Profile.show).toHaveBeenCalled();
	});
});

