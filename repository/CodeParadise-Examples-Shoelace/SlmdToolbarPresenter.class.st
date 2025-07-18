Class {
	#name : #SlmdToolbarPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Base'
}

{ #category : #nav }
SlmdToolbarPresenter >> actionItemsInitialize [
	| v |

	v := self view.
	self application actionItems do: [ :each |
		v addActionItem: each id ]
]

{ #category : #view }
SlmdToolbarPresenter >> viewCreated [

	super viewCreated.

	self subscribeToActionRequest.
	self subscribeToNavRequest.

]
