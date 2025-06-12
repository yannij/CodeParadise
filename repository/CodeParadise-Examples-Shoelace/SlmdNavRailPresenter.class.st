Class {
	#name : #SlmdNavRailPresenter,
	#superclass : #SlmdNavPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Components'
}

{ #category : #view }
SlmdNavRailPresenter >> viewInitialized [

	super viewInitialized.

	self navInitialize.

	self view navModalPaneSetUp.
	self view navInitialize.

]
