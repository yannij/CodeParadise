Class {
	#name : #TBPostListItemPresenter,
	#superclass : #CpPresenter,
	#category : #'CodeParadise-Examples-Shoelace-TinyBlogApp'
}

{ #category : #rendering }
TBPostListItemPresenter >> renderView [

	self view renderTextSlot: 'card' value: self model title index: 2
]

{ #category : #initialization }
TBPostListItemPresenter >> setDetail: request [
	| list detail |

	"request printString crTrace."

	list := self application pane1Model posts.
	detail := list at: (request parameterAt: #index).
	detail := list at: (list size atRandom \\ list size) + 1.

	self application pane2Model: detail.
	self application layout valueChanged.

]

{ #category : #view }
TBPostListItemPresenter >> viewCreated [

	self view when: (CpActionRequested id: #detail parameterKeys: #(#index)) send: #setDetail: to: self.

]
