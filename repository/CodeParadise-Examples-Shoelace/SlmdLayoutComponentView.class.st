Class {
	#name : #SlmdLayoutComponentView,
	#superclass : #SlmdView,
	#instVars : [
		'layoutView'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

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
