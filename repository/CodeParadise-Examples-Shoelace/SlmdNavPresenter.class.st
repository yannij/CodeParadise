Class {
	#name : #SlmdNavPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Base'
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

	self subscribeToNavRequest.

]
