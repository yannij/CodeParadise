Class {
	#name : #SlmdListDetailListPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3ListDetail'
}

{ #category : #rendering }
SlmdListDetailListPresenter >> renderView [

	self view
		renderTextSlot: 'listItem'
		value: self model wrappedModel title
		index: self model index
]

{ #category : #initialization }
SlmdListDetailListPresenter >> setDetail: request [

	self logTrace: request printString method: 'setDetail:'.

	self view secondaryPaneOnly.
	self application setDetailWithIndex: (request parameterAt: #index).

]

{ #category : #view }
SlmdListDetailListPresenter >> viewCreated [

	self view when: (CpActionRequested id: #detail parameterKeys: #(#index)) send: #setDetail: to: self.

]
