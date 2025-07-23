Class {
	#name : #SlmdAppBarPresenter,
	#superclass : #SlmdToolbarPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Components'
}

{ #category : #view }
SlmdAppBarPresenter >> actionGroupToUse [

	^ self model isPrimary ifTrue: [ #primary ] ifFalse: [ #secondary ]
]

{ #category : #view }
SlmdAppBarPresenter >> renderView [
	| list |

	self model isPrimary
		ifTrue: [ self view setUpLeadingAction ]
		ifFalse: [ self view setUpBackAction ].

	self model isPrimary ifTrue: [
		self view renderHeadline: self application class appName ].

	list := self actionItemsToUse collect: [ :each | each asDictionary ].
	list isEmpty ifTrue: [ ^ self ].
	self view renderTrailingActions: list asArray.

]

{ #category : #view }
SlmdAppBarPresenter >> viewInitialized [

	super viewInitialized.

	self view primary: self model primary.

]
