Class {
	#name : #SlmdObjectPresenter,
	#superclass : #SlmdPresenter,
	#instVars : [
		'isEditing'
	],
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

{ #category : #initialization }
SlmdObjectPresenter >> initialize [

	super initialize.

	isEditing := false.

]

{ #category : #accessing }
SlmdObjectPresenter >> isEditing [

	^ isEditing
]

{ #category : #accessing }
SlmdObjectPresenter >> isEditing: anObject [

	isEditing := anObject
]

{ #category : #rendering }
SlmdObjectPresenter >> renderView [
	| props |

	props := self model asProperties.
	self view fieldsSetUp: props.


]

{ #category : #view }
SlmdObjectPresenter >> viewCreated [

	super viewCreated.

	self view when: (CpActionRequested id: #action) send: #handleActionEvent: to: self.

]
