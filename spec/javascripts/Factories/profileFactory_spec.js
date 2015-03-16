"use strict";

describe("Factory: Profile", function(){
	var httpBackend;
	var mockProfileResource
	beforeEach(module("profileUpdate"));
	
	beforeEach(inject(function($injector){
		httpBackend = $injector.get('$httpBackend');
		mockProfileResource = $injector.get('Profile');
	}));
	
	describe("Show", function(){
		describe("when successful", function(){
			it("returns an object", inject(function(Profile){
			httpBackend.expectGET('/users/profiles/1.json').respond(200, {id: 1, first_name: "Morgan", last_name: "Freeman"});
			var results = mockProfileResource.show(1);
			httpBackend.flush();
			expect(JSON.stringify(results)).toBe(JSON.stringify({id: 1, first_name: "Morgan", last_name: "Freeman"}));
			}));
		});
	});
	describe("Update", function(){
		describe("when successful", function(){
			it("returns an object", function(){
				var creditObjectToUpdate = { id:1 }
				httpBackend.expectPATCH('/users/profiles.json').respond(200, {id: 1, movie: 'batman'})
				var results = mockProfileResource.update(1)
				httpBackend.flush();
				expect(results.$$state.value).toBe("Your profile has been successfully updated!");
			});
		});
		describe("when unsuccessful", function(){
			it("returns an error message", function(){
				var creditObjectToUpdate = { id:1 }
				httpBackend.expectPATCH('/users/profiles.json').respond(401, {id: 1, movie: 'batman'})
				var results = mockProfileResource.update(1)
				httpBackend.flush();
				expect(results.$$state.value).toBe("Oops...something is wrong..try again later.");
			});
		});
	});
});