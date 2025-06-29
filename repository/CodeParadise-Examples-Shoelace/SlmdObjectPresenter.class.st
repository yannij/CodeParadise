Class {
	#name : #SlmdObjectPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

{ #category : #view }
SlmdObjectPresenter >> viewCreated [

	super viewCreated.

	self view when: (CpActionRequested id: #action) send: #handleActionEvent: to: self.

]
