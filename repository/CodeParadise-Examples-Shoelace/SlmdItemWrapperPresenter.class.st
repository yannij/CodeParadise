Class {
	#name : #SlmdItemWrapperPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3ListDetail'
}

{ #category : #nav }
SlmdItemWrapperPresenter >> handleActionEvent: anObject [
	| type |

	self logTrace: anObject printString method: 'handleActionEvent:'.
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

	self view when: (CpActionRequested id: #action) send: #handleActionEvent: to: self.

]
