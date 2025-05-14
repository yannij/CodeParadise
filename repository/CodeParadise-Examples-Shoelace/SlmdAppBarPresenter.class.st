Class {
	#name : #SlmdAppBarPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #accessing }
SlmdAppBarPresenter >> renderView [

	self view
		renderLeadingAction: 'list';
		renderHeadline: self application class appName;
		renderTrailingActions;
		yourself.

	self view appBarMenuDisplay: self model appBarMenuDisplay.

]

{ #category : #accessing }
SlmdAppBarPresenter >> viewInitialized [

	super viewInitialized.

	self view
		trailingActions: { '1-square'. '2-square' . '3-square'. '4-square' }.

]
