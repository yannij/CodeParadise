Class {
	#name : #SlmdToolbarView,
	#superclass : #SlmdLayoutComponentView,
	#instVars : [
		'items'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #nav }
SlmdToolbarView >> actionItemsInitialize [
	| list actionItem |

	list := self layoutViewLazy actionItems.

	items ifNotEmpty: [
		items withIndexDo: [ :eachItem :index |
			actionItem := self iconButtonForAction: (list at: eachItem) css: 'smd-toolbar-item'.
			self appendChild: actionItem atSlotNamed: 'toolbar' ].

		actionItem := self iconButtonForAction: (list at: items last) css: nil.
		self appendChild: actionItem atSlotNamed: 'fab' ].

]

{ #category : #nav }
SlmdToolbarView >> addActionItem: anActionId [

	self items add: anActionId asSymbol
]

{ #category : #nav }
SlmdToolbarView >> buildModalNavItem [
	| tag modalMenuAction |

	modalMenuAction := (SlmdNavAction id: #modalNavButton iconName: 'list' iconLabel: 'Menu' arg1: 'Show Modal Nav') asDictionary.
	tag := self iconButtonForAction: modalMenuAction css: nil.

	^ tag
]

{ #category : #initialization }
SlmdToolbarView >> initialize [

	super initialize.

	items := OrderedCollection new.

]

{ #category : #accessing }
SlmdToolbarView >> items [

	^ items
]

{ #category : #accessing }
SlmdToolbarView >> items: anObject [

	items := anObject
]
