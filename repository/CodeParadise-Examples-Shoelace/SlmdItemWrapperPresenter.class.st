Class {
	#name : #SlmdItemWrapperPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3ListDetail'
}

{ #category : #rendering }
SlmdItemWrapperPresenter >> renderView [

	"self view renderButtons."

	self
		renderChildViewForModel: self model wrappedModel
		atSlotNamed: #wrapped
]

{ #category : #view }
SlmdItemWrapperPresenter >> viewCreated [

	super viewCreated.

	"self subscribeToActionRequest.
"
]
