Class {
	#name : #SlmdAppBarPresenter,
	#superclass : #SlmdToolbarPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #accessing }
SlmdAppBarPresenter >> viewInitialized [

	super viewInitialized.

	self actionItemsInitialize.

	self view
		"renderLeadingAction: 'list';"
		renderHeadline: self application class appName;
		"renderTrailingActions;"
		yourself.
	self view actionItemsInitialize.

]
