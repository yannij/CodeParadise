Class {
	#name : #SlmdNavBarModel,
	#superclass : #SlmdNavModel,
	#instVars : [
		'isVisible',
		'iconButtons'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #accessing }
SlmdNavBarModel >> iconButtons [

	^ iconButtons
]

{ #category : #accessing }
SlmdNavBarModel >> iconButtons: anObject [

	iconButtons := anObject
]

{ #category : #initialization }
SlmdNavBarModel >> initialize [

	super initialize.

	self iconButtons: {'1-circle'. '2-circle' . '3-circle'. '4-circle'}.

]

{ #category : #accessing }
SlmdNavBarModel >> isVisible [

	^ isVisible
]

{ #category : #accessing }
SlmdNavBarModel >> isVisible: anObject [

	isVisible := anObject
]
