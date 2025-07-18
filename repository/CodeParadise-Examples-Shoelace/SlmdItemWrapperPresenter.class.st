Class {
	#name : #SlmdItemWrapperPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3ListDetail'
}

{ #category : #events }
SlmdItemWrapperPresenter >> handleAction: anObject [
	| type |

	self logTrace5: anObject printString method: 'handleAction:'.

	type := anObject parameterAt: #type.

	type = 'update' ifTrue: [
		self model wrappedModel handleUpdate: anObject ].

	type = 'delete' ifTrue: [
		self model wrappedModel handleDelete: anObject ].

	type = 'save' ifTrue: [
		self model wrappedModel handleSave: anObject.
		self model valueChanged.
		self model isNew ifTrue: [
			self application pane1Model paneContent listAdd: self model ] ]



]

{ #category : #rendering }
SlmdItemWrapperPresenter >> renderView [

	self view renderButtons.

	self
		renderChildViewForModel: self model wrappedModel
		atSlotNamed: #wrapped
]

{ #category : #view }
SlmdItemWrapperPresenter >> viewCreated [

	super viewCreated.

	self subscribeToActionRequest.

]
