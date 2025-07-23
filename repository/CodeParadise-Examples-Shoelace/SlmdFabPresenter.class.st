Class {
	#name : #SlmdFabPresenter,
	#superclass : #SlmdToolbarPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Components'
}

{ #category : #initialization }
SlmdFabPresenter >> actionGroupToUse [

	^ #fab
]

{ #category : #rendering }
SlmdFabPresenter >> renderView [
	| list |

	list := self actionItemsToUse collect: [ :each | each asDictionary ].
	list isEmpty ifTrue: [ ^ self ].
	self view renderFab: self actionItemFabOrNil asDictionary.

]
