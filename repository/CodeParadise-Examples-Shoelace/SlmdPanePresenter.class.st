Class {
	#name : #SlmdPanePresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #rendering }
SlmdPanePresenter >> renderView [

	self view renderId: self model id content: self model content
]
