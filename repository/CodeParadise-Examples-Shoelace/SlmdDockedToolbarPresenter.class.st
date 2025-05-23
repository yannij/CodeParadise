Class {
	#name : #SlmdDockedToolbarPresenter,
	#superclass : #SlmdToolbarPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #rendering }
SlmdDockedToolbarPresenter >> renderView [
	| icons |

	icons := self model iconButtons.

	icons size >= 1 ifTrue: [
		self view renderIcon: icons first at: 'item1' with: 'smd-toolbar-button' ].
	icons size >= 2 ifTrue: [
		self view renderIcon: icons second at: 'item2' with: 'smd-toolbar-button' ].
	icons size >= 3 ifTrue: [
		self view renderIcon: icons third at: 'item3' with: 'smd-toolbar-button' ].

	self model fab ifNotNil: [ :value |
		self view renderIcon: value at: 'fab' with: 'smd-toolbar-fab' ].

]
