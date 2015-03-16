"use strict";

describe("Factory: Employment", function(){
	var mockEmploymentResource;
	var httpBackend;
	
	beforeEach(module("profileUpdate"));
	
	beforeEach(inject(function($injector){
		httpBackend = $injector.get('$httpBackend');
		mockEmploymentResource = $injector.get('Employment');
	}));
	
	describe("Show", function(){
		it("returns an object", inject(function(Employment){
			httpBackend.expectGET('/employments/1.json').respond({object: "object"});
			var results = mockEmploymentResource.show(1);
			httpBackend.flush();
			expect(JSON.stringify(results)).toBe(JSON.stringify({object: "object"}));
		}));
	});
	describe("Update", function(){
		describe("when successful", function(){
			it("returns an success message", inject(function(Employment){
				httpBackend.expectPATCH("/employments.json").respond(200, {object: "object"});
				var results = mockEmploymentResource.update(1);
				httpBackend.flush();
				expect(results.$$state.value).toBe("Your employment information has been successfully updated!");
			}));
		});
		describe("when unsuccessful", function(){
			it("returns an error message", inject(function(Employment){
				httpBackend.expectPATCH("/employments.json").respond(401, {object: "object"});
				var results = mockEmploymentResource.update(1);
				httpBackend.flush();
				expect(results.$$state.value).toBe("Oops...something is wrong..try again later.");
			}));
		});
	});
});