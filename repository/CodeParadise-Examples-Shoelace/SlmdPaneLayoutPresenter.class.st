Class {
	#name : #SlmdPaneLayoutPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #rendering }
SlmdPaneLayoutPresenter >> renderView [

	self model topAppBarModel ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #topAppBar ].
	self view topAppBarDisplay: self model topAppBarDisplayed.

	self application pane1Model ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #pane1 ].

	self application pane2Model ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #pane2 ].

	"self view bodyPanesAdapt: self model useTwoPaneBody."

]
