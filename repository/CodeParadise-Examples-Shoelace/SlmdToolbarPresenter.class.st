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

	self view when: (CpActionRequested id: #navigate parameterKeys: #(#to)) send: #handleNavTo: to: self.
	self view when: (CpActionRequested id: #navigate parameterKeys: #(#back)) send: #handleNavBack: to: self.
	self view when: (CpActionRequested id: #navigate parameterKeys: #(#refresh)) send: #handleRefresh: to: self.
	self view when: (CpActionRequested id: #action) send: #handleActionEvent: to: self.

]
