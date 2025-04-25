Class {
	#name : #SlmdPaneLayoutPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #rendering }
SlmdPaneLayoutPresenter >> renderView [

	self model topAppBarModel ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #topAppBar.
		self renderChildViewForModel: value atSlotNamed: #topAppBarP2 ].
	self view topAppBarDisplay: self model topAppBarDisplayed.

	self application pane1Model ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #pane1.
		self renderChildViewForModel: value atSlotNamed: #pane1P2 ].

	self application pane2Model ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #pane2.
		self renderChildViewForModel: value atSlotNamed: #pane2P2 ].

]

{ #category : #rendering }
SlmdPaneLayoutPresenter >> viewInitialized [

	self view bodySetUp
]
