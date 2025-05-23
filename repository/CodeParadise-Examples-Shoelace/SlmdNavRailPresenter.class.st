Class {
	#name : #SlmdNavRailPresenter,
	#superclass : #SlmdNavPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #view }
SlmdNavRailPresenter >> viewCreated [

	super viewCreated.

	self view when: (CpActionRequested id: #navigate parameterKeys: #(#to)) send: #navigateTo: to: self.

]

{ #category : #view }
SlmdNavRailPresenter >> viewInitialized [

	super viewInitialized.

	self navSetUp.

	self view
		"navRailExpanded: self model navRailExpanded;"
		navModalPaneSetUp;
		navSetUp;
		yourself.

]
