Class {
	#name : #SlmdPaneLayoutPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #rendering }
SlmdPaneLayoutPresenter >> renderView [

	self model appBarModel ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #appBar.
		self renderChildViewForModel: value atSlotNamed: #appBarP2 ].
	self view appBarDisplay: self model appBarDisplayed.

	self application pane1Model ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #pane1.
		self renderChildViewForModel: value atSlotNamed: #pane1P2 ].

	self application pane2Model ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #pane2.
		self renderChildViewForModel: value atSlotNamed: #pane2P2 ].

]
