Class {
	#name : #SlmdNavModel,
	#superclass : #SlmdModel,
	#instVars : [
		'isModal',
		'navType'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #defaults }
SlmdNavModel class >> navTypeDefault [

	^ #rail
]

{ #category : #initialization }
SlmdNavModel >> initialize [

	super initialize.

	isModal := false.
	navType := self class navTypeDefault.

]

{ #category : #accessing }
SlmdNavModel >> isModal [

	^ isModal
]

{ #category : #accessing }
SlmdNavModel >> isModal: anObject [

	isModal := anObject
]

{ #category : #accessing }
SlmdNavModel >> navType [

	^ navType
]

{ #category : #accessing }
SlmdNavModel >> navType: anObject [

	navType := anObject
]
