Class {
	#name : #SlmdPanePresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Components'
}

{ #category : #rendering }
SlmdPanePresenter >> renderView [

	self model appBarModel ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #appBar ].

	self model paneContent ifNotNil: [ :value |
		self renderChildViewForModel: value atSlotNamed: #paneContent ].

]
