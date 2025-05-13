Class {
	#name : #SlmdPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #view }
SlmdPresenter >> viewCreated [

	self view log: 'viewCreated'.
	super viewCreated
]

{ #category : #view }
SlmdPresenter >> viewInitialized [

	self view log: 'viewInitialized'.
	super viewInitialized
]
