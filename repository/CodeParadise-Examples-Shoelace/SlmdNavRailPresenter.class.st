Class {
	#name : #SlmdNavRailPresenter,
	#superclass : #SlmdNavPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #view }
SlmdNavRailPresenter >> viewInitialized [

	super viewInitialized.

	self navInitialize.

	self view navModalPaneSetUp.
	self view navInitialize.

]
