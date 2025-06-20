Class {
	#name : #SlmdItemWrapperPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3ListDetail'
}

{ #category : #nav }
SlmdItemWrapperPresenter >> handleActionEvent: anObject [

	self model wrappedModel handleActionEvent: anObject.
	self model valueChanged.

]

{ #category : #rendering }
SlmdItemWrapperPresenter >> renderView [

	self
		renderChildViewForModel: self model wrappedModel
		atSlotNamed: #wrapped
]

{ #category : #view }
SlmdItemWrapperPresenter >> viewCreated [

	super viewCreated.

	self view when: (CpActionRequested id: #action) send: #handleActionEvent: to: self.

]
