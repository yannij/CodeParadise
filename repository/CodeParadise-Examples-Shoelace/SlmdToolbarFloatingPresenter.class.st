Class {
	#name : #SlmdToolbarFloatingPresenter,
	#superclass : #SlmdToolbarPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Components'
}

{ #category : #initialization }
SlmdToolbarFloatingPresenter >> actionGroupToUse [

	^ #toolbar
]

{ #category : #rendering }
SlmdToolbarFloatingPresenter >> renderView [
	| list |

	list := self actionItemsToUse collect: [ :each | each asDictionary ].
	list isEmpty ifTrue: [ ^ self ].
	self view renderButtons: list asArray.
	self view renderFab: self actionItemFabOrNil asDictionary.

]
