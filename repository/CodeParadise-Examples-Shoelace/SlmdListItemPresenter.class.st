Class {
	#name : #SlmdListItemPresenter,
	#superclass : #SlmdPresenter,
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
	| paneLayoutModel |

	"self logTrace: request printString."

	self application setDetailWithIndex: (request parameterAt: #index).
	paneLayoutModel := application layout paneLayout.
	paneLayoutModel pane2 valueChanged.
	self view layoutViewFind secondaryPaneOnly.

]

{ #category : #view }
SlmdListItemPresenter >> viewCreated [

	self view when: (CpActionRequested id: #detail parameterKeys: #(#index)) send: #setDetail: to: self.

]
