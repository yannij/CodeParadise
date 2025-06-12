Class {
	#name : #SlmdToolbarFloatingPresenter,
	#superclass : #SlmdToolbarPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Components'
}

{ #category : #view }
SlmdToolbarFloatingPresenter >> viewInitialized [

	super viewInitialized.

	self actionItemsInitialize.

	self view actionItemsInitialize.

]
