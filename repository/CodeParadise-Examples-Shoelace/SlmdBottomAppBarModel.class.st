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

{ #category : #accessing }
SlmdBottomAppBarModel >> isVisible [

	^ isVisible
]

{ #category : #accessing }
SlmdBottomAppBarModel >> isVisible: anObject [

	isVisible := anObject
]
