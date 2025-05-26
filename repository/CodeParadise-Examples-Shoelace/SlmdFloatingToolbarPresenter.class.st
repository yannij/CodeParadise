Class {
	#name : #SlmdFloatingToolbarPresenter,
	#superclass : #SlmdToolbarPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #view }
SlmdFloatingToolbarPresenter >> viewInitialized [

	super viewInitialized.

	self actionItemsInitialize.

	self view actionItemsInitialize.

]
