Class {
	#name : #SlmdDockedToolbarModel,
	#superclass : #SlmdToolbarModel,
	#instVars : [
		'isVisible',
		'iconButtons',
		'fab'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #'as yet unclassified' }
SlmdDockedToolbarModel >> fab [

	^ fab
]

{ #category : #'as yet unclassified' }
SlmdDockedToolbarModel >> fab: anObject [

	fab := anObject
]

{ #category : #accessing }
SlmdDockedToolbarModel >> iconButtons [

	^ iconButtons
]

{ #category : #accessing }
SlmdDockedToolbarModel >> iconButtons: anObject [

	iconButtons := anObject
]

{ #category : #initialization }
SlmdDockedToolbarModel >> initialize [

	super initialize.

	self
		iconButtons: {'1-circle'. '2-circle' . '3-circle'. '4-circle'};
		fab: 'plus'.

]

{ #category : #accessing }
SlmdDockedToolbarModel >> isVisible [

	^ isVisible
]

{ #category : #accessing }
SlmdDockedToolbarModel >> isVisible: anObject [

	isVisible := anObject
]
