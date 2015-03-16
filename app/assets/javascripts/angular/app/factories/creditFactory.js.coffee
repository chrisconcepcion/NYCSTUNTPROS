angular.module("profileUpdate").factory "Credit", [
	"$resource"
	"$q"
	($resource, $q) ->
		Credit = ->
			@service = $resource("/credits/:id.json", {id: @id}, 'update': {method: 'PATCH', params: {id: '@id'}, headers: {'Content-Type': 'application/json'}}, 'delete': {method: 'DELETE', headers: {'Content-Type': 'application/json'}})
			return
		Credit::all = ->
			@service.query()
		Credit::create = (newCreditObject) ->
			deferred = $q.defer()
			@service.save(credit: newCreditObject).$promise.then ((data) ->
				deferred.resolve (data)
				),(err) ->
					deferred.reject ("Oops...something is wrong..try again later.")
			return deferred.promise
		Credit::destroy = (creditObjectToDelete) ->
			deferred = $q.defer()
			@service.delete(id: creditObjectToDelete.id, credit: creditObjectToDelete).$promise.then ((data) ->
				deferred.resolve (data)
				),(error) ->
					deferred.reject("Oops...something is wrong..try again later.")
			return deferred.promise				
		Credit::update = (updatedCreditObject) ->
			deferred = $q.defer()
			@service.update(id: updatedCreditObject.id, credit: updatedCreditObject).$promise.then ((data) ->
				deferred.resolve (data)
				),(error) ->
					deferred.reject("Oops...something is wrong..try again later.")
			return deferred.promise				
		return new Credit
]