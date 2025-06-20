Class {
	#name : #SlmdLayoutComponentView,
	#superclass : #SlmdView,
	#instVars : [
		'layoutView'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Base'
}

{ #category : #'actions - nav' }
SlmdLayoutComponentView >> doAction: aNavAction [

	^ self layoutViewLazy doAction: aNavAction
]

{ #category : #accessing }
SlmdLayoutComponentView >> layoutView [

	^ layoutView
]

{ #category : #accessing }
SlmdLayoutComponentView >> layoutView: anObject [

	layoutView := anObject
]

{ #category : #accessing }
SlmdLayoutComponentView >> layoutViewLazy [

	layoutView ifNil: [
		layoutView := self layoutViewFind ].

	^ layoutView
]
