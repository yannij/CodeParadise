Class {
	#name : #SlmdNavBarPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #rendering }
SlmdNavBarPresenter >> renderView [
	| icons |

	icons := self model iconButtons.

	icons size >= 1 ifTrue: [
		self view renderIcon: icons first at: 'item1' with: 'smd-navBar-button' ].
	icons size >= 2 ifTrue: [
		self view renderIcon: icons second at: 'item2' with: 'smd-navBar-button' ].
	icons size >= 3 ifTrue: [
		self view renderIcon: icons third at: 'item3' with: 'smd-navBar-button' ].

]
