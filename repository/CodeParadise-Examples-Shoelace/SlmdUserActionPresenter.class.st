Class {
	#name : #SlmdUserActionPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Components'
}

{ #category : #rendering }
SlmdUserActionPresenter >> renderView [

	self view renderNavActionId: self model id
]

{ #category : #view }
SlmdUserActionPresenter >> viewCreated [

	super viewCreated.

	self subscribeToActionRequest.
	self subscribeToNavRequest.

]
