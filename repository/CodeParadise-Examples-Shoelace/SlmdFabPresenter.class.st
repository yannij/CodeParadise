Class {
	#name : #SlmdFabPresenter,
	#superclass : #SlmdToolbarPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Components'
}

{ #category : #view }
SlmdFabPresenter >> viewInitialized [

	super viewInitialized.

	self actionItemsInitialize.

	self view actionItemsInitialize.

]
