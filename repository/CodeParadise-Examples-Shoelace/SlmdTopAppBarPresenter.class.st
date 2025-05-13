Class {
	#name : #SlmdTopAppBarPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #accessing }
SlmdTopAppBarPresenter >> renderView [

	self view
		renderLeadingAction: 'list';
		renderHeadline: self application class appName;
		renderTrailingActions;
		yourself.

	self view topAppBarMenuDisplay: self model topAppBarMenuDisplay.

]

{ #category : #accessing }
SlmdTopAppBarPresenter >> viewInitialized [

	super viewInitialized.

	self view
		trailingActions: { '1-square'. '2-square' . '3-square'. '4-square' }.

]
