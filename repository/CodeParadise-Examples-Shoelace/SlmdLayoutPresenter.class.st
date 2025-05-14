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

	aspect = #isExpanded ifTrue: [
		^ self model navRail isExpanded: aspectValue ].

	aspect = #navModal ifTrue: [
		^ self model navRail isModal: aspectValue ].

	aspect = #twoPaneSplitPosition ifTrue: [
		"('#twoPaneSplitPosition -> ' , aspectValue asString) traceCr."
		^ self model paneLayout pane1Width: aspectValue"; valueChanged" ].

	aspect = #appBarMenuDisplay ifTrue: [
		"('#appBarMenuDisplay -> ' , aspectValue asString) traceCr."
		^ self model paneLayout appBarModel appBarMenuDisplay: aspectValue"; valueChanged" ].

	aspect = #appBarDisplay ifTrue: [
		"('#appBarDisplay -> ' , aspectValue asString) traceCr."
		^ self model paneLayout appBarDisplayed: aspectValue"; valueChanged" ]
]

{ #category : #view }
SlmdLayoutPresenter >> navigateTo: anObject [

	self application pane1Model handleActionRequest: anObject; valueChanged.

]

{ #category : #view }
SlmdLayoutPresenter >> renderView [

	self model layoutSettings ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: nil ].

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

	self model toolbar ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #toolbar ].

]

{ #category : #view }
SlmdLayoutPresenter >> viewCreated [

	super viewCreated.

	self view
		when: (CpActionRequested id: #adapt) send: #handleAdapt: to: self;
		when: (CpActionRequested id: #navigate parameterKeys: #(#to)) send: #navigateTo: to: self.

]

{ #category : #view }
SlmdLayoutPresenter >> viewInitialized [

	super viewInitialized.

	"self model layoutSettings useAutoLayout ifTrue: [
		self view layoutAdaptToWidth ]."

]
