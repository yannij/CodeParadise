Class {
	#name : #SlmdNavRailModel,
	#superclass : #SlmdModel,
	#instVars : [
		'isModal',
		'isExpanded'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #initialization }
SlmdNavRailModel >> initialize [

	super initialize.

	isModal := false.
	isExpanded := false.

]

{ #category : #accessing }
SlmdNavRailModel >> isExpanded [

	^ isExpanded
]

{ #category : #accessing }
SlmdNavRailModel >> isExpanded: anObject [

	isExpanded := anObject
]

{ #category : #accessing }
SlmdNavRailModel >> isModal [

	^ isModal
]

{ #category : #accessing }
SlmdNavRailModel >> isModal: anObject [

	isModal := anObject
]
