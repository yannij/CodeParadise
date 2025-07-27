Class {
	#name : #SlRadio,
	#superclass : #SlElement,
	#category : #'CodeParadise-WebApplication-Shoelace-Elements'
}

{ #category : #evaluating }
SlRadio >> value [

	"Selected value (a String)"

	^ self propertyAt: #value
]

{ #category : #accessing }
SlRadio >> value: aString [

	self propertyAt: #value put: aString
]
