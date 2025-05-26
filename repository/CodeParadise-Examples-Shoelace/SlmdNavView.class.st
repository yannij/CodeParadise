Class {
	#name : #SlmdNavView,
	#superclass : #SlmdLayoutComponentView,
	#instVars : [
		'navItems'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #nav }
SlmdNavView >> addNavAction: props [

	self layoutViewLazy addNavAction: props
]

{ #category : #nav }
SlmdNavView >> addNavItem: aNavActionId [

	self navItems add: aNavActionId asSymbol
]

{ #category : #initialization }
SlmdNavView >> initialize [

	super initialize.

	navItems := OrderedCollection new.

]

{ #category : #accessing }
SlmdNavView >> navActions [

	^ self layoutViewLazy navActions
]

{ #category : #accessing }
SlmdNavView >> navItems [

	^ navItems
]

{ #category : #accessing }
SlmdNavView >> navItems: anObject [

	navItems := anObject
]
