Class {
	#name : #SlmdPanePresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-Examples-Shoelace-MaterialDesign3App'
}

{ #category : #rendering }
SlmdPanePresenter >> renderView [

	self view renderId: self model id content: self model content
]
