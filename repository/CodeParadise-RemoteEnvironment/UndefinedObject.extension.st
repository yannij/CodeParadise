Extension { #name : #UndefinedObject }

{ #category : #'*CodeParadise-RemoteEnvironment' }
UndefinedObject >> asJsonObjectValue [

	"Answer a representation of the receiver to be used in a JSON Object.

	JSON values can either be: String, Number (Float or Integer), Boolean, nil,
	a Dictionary-like value (Dictionary, OrderedDictionary or subclasses)
	or an Array of such elements."

	<applicationExtension>

	^ self
]

{ #category : #'*CodeParadise-RemoteEnvironment' }
UndefinedObject >> cpEncodeWith: anEncoder [

	<clientEnvironment>

	anEncoder encodeNil
]
