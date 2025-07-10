Extension { #name : #SlFormControl }

{ #category : #'*CodeParadise-Examples-Shoelace' }
SlFormControl >> slmdValue [
	"Answer form control value that can be passed via an announcement to the server.
	Subclasses must override as needed."

	^ self value
]
