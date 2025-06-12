Class {
	#name : #SlmdAppBarPresenter,
	#superclass : #SlmdToolbarPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Components'
}

{ #category : #view }
SlmdAppBarPresenter >> viewInitialized [

	super viewInitialized.

	self view setPrimary: self model primary.
	self actionItemsInitialize.

	self model isPrimary ifTrue: [
		self view renderHeadline: self application class appName ].
	self view actionItemsInitialize.

]
