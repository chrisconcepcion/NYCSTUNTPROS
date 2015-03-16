"use strict";


describe("Factory: Contact", function(){
	var $httpBackend;
	var mockContactResource;
	
	beforeEach(module("profileUpdate"));
	
	beforeEach(inject(function($injector){
		$httpBackend = $injector.get('$httpBackend');
		mockContactResource = $injector.get('Contact');
  }));
	
	
	describe("Show", function(){
		it("should return Gabe", inject(function (Contact) {
			$httpBackend.expectGET('/contacts/1.json').respond(200, {id: 1, first_name: "Gabe", last_name: "Newell"});
			var results = mockContactResource.show(1);
			$httpBackend.flush();
			expect(JSON.stringify(results)).toBe(JSON.stringify({id: 1, first_name: "Gabe", last_name: "Newell"}));
		}));
	});
	describe("Update", function(){
		describe("when successful", function(){
			it("returns a success message", inject(function (Contact) {
				$httpBackend.expectPATCH('/contacts.json').respond(200, '');
				var results = mockContactResource.update(1);
				$httpBackend.flush();
				expect(results.$$state.value).toBe("Your contact information has been successfully updated!");
			}));
		});
		describe("when unsuccessful", function(){
			it("returns a unsuccessful message", inject(function (Contact) {
				$httpBackend.expectPATCH('/contacts.json').respond(401, '')
				var results = mockContactResource.update(1);
				$httpBackend.flush();
				expect(results.$$state.value).toBe("Oops...something is wrong..try again later.");
			}));
		});
	});
});