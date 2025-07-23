Class {
	#name : #SlmdToolbarDockedPresenter,
	#superclass : #SlmdToolbarPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Components'
}

{ #category : #initialization }
SlmdToolbarDockedPresenter >> actionGroupToUse [

	^ #toolbar
]

{ #category : #view }
SlmdToolbarDockedPresenter >> renderView [
	| list |

	list := self actionItemsToUse collect: [ :each | each asDictionary ].
	list isEmpty ifTrue: [ ^ self ].
	self view renderButtons: list asArray.
	self view renderFab: self actionItemFabOrNil asDictionary.

]
