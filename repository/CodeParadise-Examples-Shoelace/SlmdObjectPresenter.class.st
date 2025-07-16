Class {
	#name : #SlmdObjectPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

{ #category : #rendering }
SlmdObjectPresenter >> renderView [
	| props |

	props := self model asProperties.
	self view fieldsSetUp: props.


]

{ #category : #view }
SlmdObjectPresenter >> viewCreated [

	super viewCreated.

	self view when: SlmdNavActionRequest actionRequest send: #handleActionEvent: to: self.

]
