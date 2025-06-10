Class {
	#name : #SlmdPanePresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #rendering }
SlmdPanePresenter >> renderView [

	self model appBarModel ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #appBar ].

	self model paneContent ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #paneContent ].

	self view renderId: self model id content: self model content

]
