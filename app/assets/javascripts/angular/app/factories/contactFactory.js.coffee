angular.module("profileUpdate").factory "Contact", [
	"$resource"
	"$q"
	($resource, $q) ->
		Contact = ->
			@service = $resource("/contacts/:id.json", {id: @id}, 'update': {method: 'PATCH', params: {id: '@id'}, headers: {'Content-Type': 'application/json'}})
			return
		Contact::show = (userId) ->
			@service.get(id: userId)
		Contact::update = (updatedContactObject) ->
			deferred = $q.defer()
			@service.update(id: updatedContactObject.id, updatedContactObject).$promise.then ((data) ->
				deferred.resolve ("Your contact information has been successfully updated!")
				),(err) ->
					deferred.reject ("Oops...something is wrong..try again later.")
			return deferred.promise
		return new Contact
]

