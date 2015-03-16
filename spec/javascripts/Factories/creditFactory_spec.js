"use strict";

describe("Factory: Credit", function(){
	var httpBackend;
	var mockCreditResource;
	beforeEach(module("profileUpdate"));
	
	beforeEach(inject(function($injector){
		httpBackend = $injector.get('$httpBackend');
		mockCreditResource = $injector.get('Credit');
	}));
	
	describe("All", function(){
		it("returns an array of credits", inject(function(Credit){
			httpBackend.expectGET('/credits.json').respond(200, [{id: 1, movie: 'batman'}, { id: 2, movie: 'ratman'}]);
			var results = mockCreditResource.all();
			httpBackend.flush();
			expect(JSON.stringify(results)).toEqual(JSON.stringify([ {id: 1, movie: 'batman'}, { id: 2, movie: 'ratman'} ]));
		}));
	});
	describe("Create", function(){
		describe("when successful", function(){
			it("returns an object", function(){
				httpBackend.expectPOST('/credits.json').respond(200, {id: 1, movie: 'batman'})
				var results = mockCreditResource.create();
				httpBackend.flush();
				expect(JSON.stringify(results.$$state.value)).toBe(JSON.stringify({id: 1, movie: 'batman'}));
			});
		});
		describe("when unsuccessful", function(){
			it("returns an error message", function(){
				httpBackend.expectPOST('/credits.json').respond(401, '')
				var results = mockCreditResource.create();
				httpBackend.flush();
				expect(results.$$state.value).toBe("Oops...something is wrong..try again later.");
			});
		});
	});
	describe("Destroy", function(){
		describe("when successful", function(){
			it("returns an object", function(){
				var creditObjectToDelete = { id:1 }
				httpBackend.expectDELETE('/credits/1.json?credit=%7B%22id%22:1%7D').respond(200, {id: 1, movie: 'batman'})
				var results = mockCreditResource.destroy(creditObjectToDelete);
				httpBackend.flush();
				expect(JSON.stringify(results.$$state.value)).toBe(JSON.stringify({id: 1, movie: 'batman'}));
			});
		});
		describe("when unsuccessful", function(){
			it("returns an error message", function(){
				var creditObjectToDelete = { id:1 }
				httpBackend.expectDELETE('/credits/1.json?credit=%7B%22id%22:1%7D').respond(401, '')
				var results = mockCreditResource.destroy(creditObjectToDelete);
				httpBackend.flush();
				expect(results.$$state.value).toBe("Oops...something is wrong..try again later.");
			});
		});
	});
	describe("Update", function(){
		describe("when successful", function(){
			it("returns an object", function(){
				var creditObjectToUpdate = { id:1 }
				httpBackend.expectPATCH('/credits/1.json').respond(200, {id: 1, movie: 'batman'})
				var results = mockCreditResource.update(creditObjectToUpdate);
				httpBackend.flush();
				expect(JSON.stringify(results.$$state.value)).toBe(JSON.stringify({id: 1, movie: 'batman'}));
			});
		});
		describe("when unsuccessful", function(){
			it("returns an error message", function(){
				var creditObjectToUpdate = { id:1 }
				httpBackend.expectPATCH('/credits/1.json').respond(401, '')
				var results = mockCreditResource.update(creditObjectToUpdate);
				httpBackend.flush();
				expect(results.$$state.value).toBe("Oops...something is wrong..try again later.");
			});
		});
	});
});

