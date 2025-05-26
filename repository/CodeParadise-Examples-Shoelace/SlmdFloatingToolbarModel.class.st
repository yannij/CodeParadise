Class {
	#name : #SlmdFloatingToolbarModel,
	#superclass : #SlmdToolbarModel,
	#instVars : [
		'isVisible',
		'iconButtons',
		'fab'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #accessing }
SlmdFloatingToolbarModel >> fab [

	^ fab
]

{ #category : #accessing }
SlmdFloatingToolbarModel >> fab: anObject [

	fab := anObject
]

{ #category : #accessing }
SlmdFloatingToolbarModel >> iconButtons [

	^ iconButtons
]

{ #category : #accessing }
SlmdFloatingToolbarModel >> iconButtons: anObject [

	iconButtons := anObject
]

{ #category : #initialization }
SlmdFloatingToolbarModel >> initialize [

	super initialize.

	self
		iconButtons: {'1-circle'. '2-circle' . '3-circle'. '4-circle'};
		fab: 'plus'.

]

{ #category : #accessing }
SlmdFloatingToolbarModel >> isVisible [

	^ isVisible
]

{ #category : #accessing }
SlmdFloatingToolbarModel >> isVisible: anObject [

	isVisible := anObject
]
