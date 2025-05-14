Class {
	#name : #SlmdToolbarModel,
	#superclass : #SlmdModel,
	#instVars : [
		'isVisible',
		'iconButtons',
		'fab'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #'as yet unclassified' }
SlmdToolbarModel >> fab [

	^ fab
]

{ #category : #'as yet unclassified' }
SlmdToolbarModel >> fab: anObject [

	fab := anObject
]

{ #category : #accessing }
SlmdToolbarModel >> iconButtons [

	^ iconButtons
]

{ #category : #accessing }
SlmdToolbarModel >> iconButtons: anObject [

	iconButtons := anObject
]

{ #category : #initialization }
SlmdToolbarModel >> initialize [

	super initialize.

	self
		iconButtons: {'1-circle'. '2-circle' . '3-circle'. '4-circle'};
		fab: 'plus'.

]

{ #category : #accessing }
SlmdToolbarModel >> isVisible [

	^ isVisible
]

{ #category : #accessing }
SlmdToolbarModel >> isVisible: anObject [

	isVisible := anObject
]
