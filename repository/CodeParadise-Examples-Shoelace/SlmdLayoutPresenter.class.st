Class {
	#name : #SlmdLayoutPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #view }
SlmdLayoutPresenter >> handleAdapt: anObject [
	| aspect aspectValue |

	"anObject printString traceCr."
	aspect := anObject parameterAt: #aspect.
	aspectValue := anObject parameterAt: #value.

	aspect = #paneLayout ifTrue: [
		"('#paneLayout -> ' , aspectValue asString) traceCr."
		self model paneLayout useTwoPaneBody: aspectValue.
		^ self ].

	aspect = #twoPaneSplitPosition ifTrue: [
		"('#twoPaneSplitPosition -> ' , aspectValue asString) traceCr."
		^ self model paneLayout pane1Width: aspectValue"; valueChanged" ].

	aspect = #topAppBarMenuDisplay ifTrue: [
		"('#topAppBarMenuDisplay -> ' , aspectValue asString) traceCr."
		^ self model paneLayout topAppBarModel topAppBarMenuDisplay: aspectValue"; valueChanged" ].

	aspect = #topAppBarDisplay ifTrue: [
		"('#topAppBarDisplay -> ' , aspectValue asString) traceCr."
		^ self model paneLayout topAppBarDisplayed: aspectValue"; valueChanged" ]
]

{ #category : #view }
SlmdLayoutPresenter >> layoutSetUp [

	self navSetUp.
	self setBottomAppBar.

]

{ #category : #rendering }
SlmdLayoutPresenter >> navSetUp [
	| v |

	v := self view.
	self application navActions do: [ :eachNavAction |
		eachNavAction asDictionary keysAndValuesDo: [ :key :value |
			v addNavActionId: eachNavAction id key: key value: value ].
		v addNavItem: eachNavAction id ]
]

{ #category : #view }
SlmdLayoutPresenter >> navigateTo: anObject [

	self application pane1Model handleActionRequest: anObject; valueChanged.

]

{ #category : #view }
SlmdLayoutPresenter >> renderView [

	self model paneLayout ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #paneLayout ].

	self model bottomAppBar ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #bottomAppBar ].

	self application sidesheetModel ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #sidesheet ]
]

{ #category : #rendering }
SlmdLayoutPresenter >> setBottomAppBar [

	self view
		iconButtons: {'1-circle'. '2-circle' . '3-circle'. '4-circle'};
		fab: 'plus'.

]

{ #category : #view }
SlmdLayoutPresenter >> viewCreated [

	self view when: (CpActionRequested id: #adapt) send: #handleAdapt: to: self.

	self view when: (CpActionRequested id: #navigate parameterKeys: #(#to)) send: #navigateTo: to: self.

]

{ #category : #view }
SlmdLayoutPresenter >> viewInitialized [

	self layoutSetUp.
	self view layoutSetUp.
	self view adjustBodyHeight.

]
