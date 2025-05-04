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

	aspect = #navType ifTrue: [
		^ self model nav navType: aspectValue ].

	aspect = #navModal ifTrue: [
		^ self model nav isModal: aspectValue ].

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
SlmdLayoutPresenter >> navigateTo: anObject [

	self application pane1Model handleActionRequest: anObject; valueChanged.

]

{ #category : #view }
SlmdLayoutPresenter >> renderView [

	self model nav ifNotNil: [ :value |
		"Render the nav before the panes, so TopAppBar can find
		the model nav pane for menu button to open"
		self renderChildViewForModel: value atSlotNamed: #navRegion ].

	self model paneLayout ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #paneLayout ].

	self application sidesheetModel ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #sidesheet ].

	self model bottomAppBar ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #bottomAppBar ].

]

{ #category : #view }
SlmdLayoutPresenter >> viewCreated [

	self view when: (CpActionRequested id: #adapt) send: #handleAdapt: to: self.

	self view when: (CpActionRequested id: #navigate parameterKeys: #(#to)) send: #navigateTo: to: self.

]

{ #category : #view }
SlmdLayoutPresenter >> viewInitialized [

	self view layoutSetUp.
	self view adjustBodyHeight.

]
