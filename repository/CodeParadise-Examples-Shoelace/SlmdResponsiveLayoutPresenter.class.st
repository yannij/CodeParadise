Class {
	#name : #SlmdResponsiveLayoutPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Components'
}

{ #category : #view }
SlmdResponsiveLayoutPresenter >> handleViewAction: anObject [
	| aspect aspectValue |

	self logTrace: anObject printString.
	aspect := anObject parameterAt: #aspect.
	aspectValue := anObject parameterAt: #value.

]

{ #category : #view }
SlmdResponsiveLayoutPresenter >> renderView [

	self model navRail ifNotNil: [ :value |
		"Render the navRail before the panes, so AppBar can find
		the modal navRail pane for menu button to open"
		self renderChildViewForModel: value atSlotNamed: #navRegion ].

	self model navBar ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #navBar ].

	self model paneLayout ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #paneLayout ].

	self application sidesheetModel ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #sidesheet ].

	self model dockedToolbar ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #dockedToolbar ].

	self model floatingToolbar ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #floatingToolbar ].

	self model layoutSettings ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: nil ].

]

{ #category : #view }
SlmdResponsiveLayoutPresenter >> viewCreated [

	super viewCreated.

	self view
		when: (CpActionRequested id: #navigate parameterKeys: #(#to)) send: #navigateTo: to: self;
		yourself.

]

{ #category : #view }
SlmdResponsiveLayoutPresenter >> viewInitialized [
	| v |

	super viewInitialized.

	v := self view.

	self application navActions do: [ :eachNavAction |
		v addNavAction: eachNavAction asDictionary ].

	self application actionItems do: [ :each |
		each asDictionary keysAndValuesDo: [ :key :value |
			v addActionItemId: each id key: key value: value ] ].


]
