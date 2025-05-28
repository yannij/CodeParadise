Class {
	#name : #SlmdNavBarModel,
	#superclass : #SlmdNavModel,
	#instVars : [
		'isVisible',
		'iconButtons'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #'as yet unclassified' }
SlmdNavBarModel >> iconButtons [

	^ iconButtons
]

{ #category : #'as yet unclassified' }
SlmdNavBarModel >> iconButtons: anObject [

	iconButtons := anObject
]

{ #category : #initialization }
SlmdNavBarModel >> initialize [

	super initialize.

	self iconButtons: {'1-circle'. '2-circle' . '3-circle'. '4-circle'}.

]

{ #category : #'as yet unclassified' }
SlmdNavBarModel >> isVisible [

	^ isVisible
]

{ #category : #'as yet unclassified' }
SlmdNavBarModel >> isVisible: anObject [

	isVisible := anObject
]
