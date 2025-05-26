Class {
	#name : #SlmdDockedToolbarPresenter,
	#superclass : #SlmdToolbarPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #view }
SlmdDockedToolbarPresenter >> viewInitialized [

	super viewInitialized.

	self actionItemsInitialize.

	self view actionItemsInitialize.

]
