Class {
	#name : #SlmdCrudPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

{ #category : #view }
SlmdCrudPresenter >> viewCreated [

	super viewCreated.

	self view when: (CpActionRequested id: #action) send: #handleActionEvent: to: self.

]
