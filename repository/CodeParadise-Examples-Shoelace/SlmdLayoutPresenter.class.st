Class {
	#name : #SlmdLayoutPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #view }
SlmdLayoutPresenter >> handleViewAction: anObject [
	| aspect aspectValue |

	anObject printString traceCr.
	aspect := anObject parameterAt: #aspect.
	aspectValue := anObject parameterAt: #value.

	"aspect = #aspect" "true ifTrue: [
		self traceCr: aspect asString, ': ', (self model perform: aspect asSymbol) printString.
		self model perform: (aspect, ':') asSymbol with: aspectValue.
		self traceCr: aspect asString, ': ', (self model perform: aspect asSymbol) printString.
		^ self ]."

]

{ #category : #view }
SlmdLayoutPresenter >> navigateTo: anObject [

	self application pane1Model handleActionRequest: anObject; valueChanged.

]

{ #category : #view }
SlmdLayoutPresenter >> renderView [

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

	self model layoutSettings ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: nil ].

]

{ #category : #view }
SlmdLayoutPresenter >> viewCreated [

	super viewCreated.

	self view
		when: (CpActionRequested id: #navigate parameterKeys: #(#to)) send: #navigateTo: to: self;
		yourself.

]
