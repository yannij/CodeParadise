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
			actionItem := self buildItem: (list at: eachItem) css: 'smd-toolbar-item'.
			self appendChild: actionItem atSlotNamed: 'toolbar' ].

		actionItem := self buildItem: (list at: items last).
		self appendChild: actionItem atSlotNamed: 'fab' ].

]

{ #category : #nav }
SlmdToolbarView >> addActionItem: anActionId [

	self items add: anActionId asSymbol
]

{ #category : #nav }
SlmdToolbarView >> buildItem: aNavAction [

	^ self buildItem: aNavAction css: nil
]

{ #category : #nav }
SlmdToolbarView >> buildItem: aNavAction css: cssClass [
	| iconName tag |

	iconName := aNavAction at: #iconName.

	tag := #div asHtmlTag
		when: CpClickEvent basicPrimary do: [ self executeNavAction: aNavAction ] for: self;
		appendChild: ((SlIconButton named: iconName) addClass: 'smd-toolbar-icon'; yourself);
		yourself.

	cssClass ifNotNil: [ tag addClass: cssClass ].

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
