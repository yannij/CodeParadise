Class {
	#name : #SlmdNavView,
	#superclass : #SlmdView,
	#instVars : [
		'layoutView',
		'navItems',
		'navActions'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #nav }
SlmdNavView >> addNavActionId: id key: key value: value [
	| item |

	(navActions includesKey: id) ifFalse: [
		navActions at: id put: Dictionary new ].
	item := navActions at: id.
	item at: key put: value
]

{ #category : #nav }
SlmdNavView >> addNavItem: aNavActionId [

	self navItems add: aNavActionId asSymbol
]

{ #category : #initialization }
SlmdNavView >> initialize [

	super initialize.

	navActions := Dictionary new.
	navItems := OrderedCollection new.

]

{ #category : #accessing }
SlmdNavView >> layoutView [

	^ layoutView
]

{ #category : #accessing }
SlmdNavView >> layoutView: anObject [

	layoutView := anObject
]

{ #category : #accessing }
SlmdNavView >> layoutViewLazy [

	layoutView ifNil: [
		layoutView := self layoutViewFind ].

	^ layoutView
]

{ #category : #accessing }
SlmdNavView >> navActions [

	^ navActions
]

{ #category : #accessing }
SlmdNavView >> navActions: anObject [

	navActions := anObject
]

{ #category : #accessing }
SlmdNavView >> navItems [

	^ navItems
]

{ #category : #accessing }
SlmdNavView >> navItems: anObject [

	navItems := anObject
]
