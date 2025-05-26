Class {
	#name : #SlmdNavPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #nav }
SlmdNavPresenter >> navInitialize [
	| v |

	v := self view.
	self application navActions do: [ :eachNavAction |
		v addNavItem: eachNavAction id ]
]

{ #category : #view }
SlmdNavPresenter >> viewCreated [

	super viewCreated.

	self view when: (CpActionRequested id: #navigate parameterKeys: #(#to)) send: #navigateTo: to: self.

]
