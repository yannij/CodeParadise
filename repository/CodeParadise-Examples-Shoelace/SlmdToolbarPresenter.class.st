Class {
	#name : #SlmdToolbarPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
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

	self view when: (CpActionRequested id: #navigate parameterKeys: #(#to)) send: #navigateTo: to: self.

]
