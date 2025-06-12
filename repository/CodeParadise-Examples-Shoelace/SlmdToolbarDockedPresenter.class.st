Class {
	#name : #SlmdToolbarDockedPresenter,
	#superclass : #SlmdToolbarPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Components'
}

{ #category : #view }
SlmdToolbarDockedPresenter >> viewInitialized [

	super viewInitialized.

	self actionItemsInitialize.

	self view actionItemsInitialize.

]
