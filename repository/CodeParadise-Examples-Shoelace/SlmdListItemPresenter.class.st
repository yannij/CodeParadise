Class {
	#name : #SlmdListItemPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

{ #category : #rendering }
SlmdListItemPresenter >> renderView [

	self view
		renderTextSlot: 'listItem'
		value: self model wrappedModel title
		index: self model index
]

{ #category : #initialization }
SlmdListItemPresenter >> setDetail: request [

	request printString traceCr.

	self application setDetailWithIndex: (request parameterAt: #index).
	self application layout paneLayout valueChanged.

]

{ #category : #view }
SlmdListItemPresenter >> viewCreated [

	self view when: (CpActionRequested id: #detail parameterKeys: #(#index)) send: #setDetail: to: self.

]
