angular.module("profileUpdate").factory "Employment", [
	"$resource"
	"$q"
	($resource, $q) ->
		Employment = ->
			@service = $resource("/employments/:id.json", {id: @id}, 'update': {method: 'PATCH', params: {id: '@id'}, headers: {'Content-Type': 'application/json'}})
			return
		Employment::show = (userId) ->
			@service.get(id: userId)
		Employment::update = (updatedEmploymentObject) ->
			deferred = $q.defer()
			@service.update(id: updatedEmploymentObject.id, employment: updatedEmploymentObject).$promise.then ((data) ->
			  deferred.resolve ("Your employment information has been successfully updated!")
	    ),(err) ->
				deferred.reject ("Oops...something is wrong..try again later.")
			return deferred.promise
		return new Employment
]


