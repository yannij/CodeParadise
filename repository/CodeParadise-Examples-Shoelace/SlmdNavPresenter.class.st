Class {
	#name : #SlmdNavPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Base'
}

{ #category : #rendering }
SlmdNavPresenter >> renderView [

	self view renderNavContent: (self application navActions collect: [ :each | each asDictionary ]) asArray.

]

{ #category : #view }
SlmdNavPresenter >> viewCreated [

	super viewCreated.

	self subscribeToNavRequest.

]
