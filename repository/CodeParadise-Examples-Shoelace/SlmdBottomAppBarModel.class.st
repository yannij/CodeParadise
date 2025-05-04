Class {
	#name : #SlmdBottomAppBarModel,
	#superclass : #SlmdModel,
	#instVars : [
		'isVisible',
		'iconButtons',
		'fab'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #accessing }
SlmdBottomAppBarModel >> fab [

	^ fab
]

{ #category : #accessing }
SlmdBottomAppBarModel >> fab: anObject [

	fab := anObject
]

{ #category : #accessing }
SlmdBottomAppBarModel >> iconButtons [

	^ iconButtons
]

{ #category : #accessing }
SlmdBottomAppBarModel >> iconButtons: anObject [

	iconButtons := anObject
]

{ #category : #initialization }
SlmdBottomAppBarModel >> initialize [

	super initialize.

	self
		iconButtons: {'1-circle'. '2-circle' . '3-circle'. '4-circle'};
		fab: 'plus'.

]

{ #category : #accessing }
SlmdBottomAppBarModel >> isVisible [

	^ isVisible
]

{ #category : #accessing }
SlmdBottomAppBarModel >> isVisible: anObject [

	isVisible := anObject
]
