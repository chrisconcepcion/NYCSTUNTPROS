angular.module("profileUpdate").factory "Profile", [ 
	"$resource"
	"$q"
	($resource, $q) ->
		Profile = ->
			@service = $resource("/users/profiles/:id.json", {id: @id}, 'update': {method: 'PATCH', params: {id: '@id'}, headers: {'Content-Type': 'application/json'}})
			return
		Profile::show = (userId) ->
			@service.get(id: userId)
		Profile::update = (updatedProfileObject) ->
			deferred = $q.defer()
			@service.update(id: updatedProfileObject.id, profile: updatedProfileObject).$promise.then ((data) ->
    		deferred.resolve ("Your profile has been successfully updated!")
				),(err) ->
					deferred.reject ("Oops...something is wrong..try again later.")
  		return deferred.promise
		return new Profile
]





