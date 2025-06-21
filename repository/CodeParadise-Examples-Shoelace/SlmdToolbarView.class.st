Class {
	#name : #SlmdToolbarView,
	#superclass : #SlmdLayoutComponentView,
	#instVars : [
		'items'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Base'
}

{ #category : #initialization }
SlmdToolbarView >> actionGroupToUse [

	self subclassResponsibility
]

{ #category : #initialization }
SlmdToolbarView >> actionItemFabOrNil [
	| list allActions |

	list := self layoutViewLazy actionItems.
	allActions := items collect: [ :each | list at: each ].

	^ allActions detect: [ :each | (each at: #actionGroup) = #fab ] ifNone: []
]

{ #category : #nav }
SlmdToolbarView >> actionItemsInitialize [
	| buttons iconButton fab |

	buttons := self actionItemsToUse.

	buttons ifNotEmpty: [
		buttons withIndexDo: [ :eachItem :index |
			iconButton := self iconButtonForAction: eachItem css: 'smd-toolbar-item'.
			self appendChild: iconButton atSlotNamed: 'toolbar' ].

		fab := self actionItemFabOrNil.
		fab ifNotNil: [
			iconButton := self iconButtonForAction: fab css: nil.
			self appendChild: iconButton atSlotNamed: 'fab' ] ].

]

{ #category : #initialization }
SlmdToolbarView >> actionItemsToUse [
	| list allActions groupName |

	list := self layoutViewLazy actionItems.
	allActions := items collect: [ :each | list at: each ].

	groupName := self actionGroupToUse.
	^ allActions select: [ :each | (each at: #actionGroup) = groupName ]
]

{ #category : #nav }
SlmdToolbarView >> addActionItem: anActionId [

	self items add: anActionId asSymbol
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
