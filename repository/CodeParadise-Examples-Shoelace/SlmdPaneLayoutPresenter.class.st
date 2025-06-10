Class {
	#name : #SlmdPaneLayoutPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #rendering }
SlmdPaneLayoutPresenter >> renderView [

	self model pane1 ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #pane1.
		self renderChildViewForModel: value atSlotNamed: #pane1P2 ].

	self model pane2 ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #pane2.
		self renderChildViewForModel: value atSlotNamed: #pane2P2 ].

]
