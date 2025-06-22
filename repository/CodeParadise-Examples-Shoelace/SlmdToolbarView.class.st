Class {
	#name : #SlmdToolbarView,
	#superclass : #SlmdLayoutComponentView,
	#instVars : [
		'items'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Base'
}

{ #category : #'web resources' }
SlmdToolbarView class >> globalStyle [

	<webResource: #css>

	^ '
.smd-toolbar-item {
  padding: 8px 0;
  height: 48px;
  width: 48px;
}

.smd-toolbar-icon {
  font-size: 32px;
}
'
]

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
	| buttons div iconButton fab |

	buttons := self actionItemsToUse.

	buttons ifNotEmpty: [
		div := '' inHtmlTag: #div.
		div addClass: self buttonCssClass.
		buttons withIndexDo: [ :eachItem :index |
			iconButton := self iconButtonForAction: eachItem css: 'smd-toolbar-item'.
			div appendChild: iconButton ].
		self appendChild: div atSlotNamed: 'toolbar' ].

	fab := self actionItemFabOrNil.
	fab ifNotNil: [
		div := '' inHtmlTag: #div.
		div addClass: self fabCssClass.
		iconButton := self iconButtonForAction: fab css: nil.
		div appendChild: iconButton.
		self appendChild: div atSlotNamed: 'fab' ].

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

{ #category : #nav }
SlmdToolbarView >> buttonCssClass [

	^ 'smd-toolbar-buttons'
]

{ #category : #nav }
SlmdToolbarView >> fabCssClass [

	^ 'smd-toolbar-fab'
]

{ #category : #utilities }
SlmdToolbarView >> iconButtonForAction: aNavAction css: cssClass [
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
