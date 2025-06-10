Class {
	#name : #SlmdAppBarPresenter,
	#superclass : #SlmdToolbarPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #view }
SlmdAppBarPresenter >> viewInitialized [

	super viewInitialized.

	self view setPrimary: self model primary.

	self model isPrimary ifTrue: [
		self actionItemsInitialize.
		self view renderHeadline: self application class appName.
		self view actionItemsInitialize ].

]
