Class {
	#name : #SlmdView,
	#superclass : #CpView,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #accessing }
SlmdView class >> eventIdModelUpdate [

	^ #modelUpdate
]

{ #category : #events }
SlmdView >> announceAspect: key value: anObject [

	self announceEvent: self class eventIdModelUpdate key: key value: anObject
]

{ #category : #events }
SlmdView >> announceEvent: id key: key value: anObject [

	self traceCr: id printString, ': ', key printString, ' -> ', anObject printString.

	self serverAnnounce: (CpActionRequested
		id: id
		parameters: {
			#aspect -> key.
			#value -> anObject
		} asDictionary).
]

{ #category : #utilities }
SlmdView >> findByIdInLightDom: anId [

	^ self
		findByIdInLightDom: anId
		ifNone: [ self error: '#findByIdInLightDom: ', anId asString, ' is nil' ].
]

{ #category : #utilities }
SlmdView >> findByIdInLightDom: anId ifNone: aBlock [
	| element |

	element := CpHtmlElement documentBody firstDescendantMatching: '#', anId.
	element ifNil: [ ^ aBlock value ].
	^ element

]

{ #category : #utilities }
SlmdView >> findByIdInShadowDom: anId [

	^ self
		findByIdInShadowDom: anId
		ifNone: [ self error: '#findByIdInShadowDom: ', anId asString, ' is nil' ].
]

{ #category : #utilities }
SlmdView >> findByIdInShadowDom: anId ifNone: aBlock [
	| element |

	element := self shadowedElementWithId: anId.
	element ifNil: [ ^ aBlock value ].
	^ element

]

{ #category : #utilities }
SlmdView >> layoutViewFind [

	^ SlmdLayoutView first
]

{ #category : #logging }
SlmdView >> log: aString [

	self traceCr: '**** ', self class name, ': ', aString
]

{ #category : #utilities }
SlmdView >> modalDivFind [
	"Locate the div where modal components can attach"

	^ SlmdLayoutView first findByIdInShadowDom: 'smdModalDiv'

]

{ #category : #nav }
SlmdView >> modalNavElementOrNil [
	| component |

	component := SlmdNavRailView first.
	^ component ifNil: [ nil ] ifNotNil: [ component drawer ].
]

{ #category : #settings }
SlmdView >> modalSettingsElement [
	| component |

	component := SlmdLayoutSettingsView first.
	^ component ifNil: [ self error: 'Not found: layout settings view' ] ifNotNil: [ component drawer ].
]

{ #category : #settings }
SlmdView >> modalSettingsOpen [

	self traceCr: 'settingsOpen'.
	self modalSettingsElement beOpen

]

{ #category : #utilities }
SlmdView >> moveChildrenFromSlot: fromSlot to: toSlot [
	| list |

	list := self childrenAtSlotNamed: fromSlot.
	list do: [ :each | self appendChild: each atSlotNamed: toSlot ].

]

{ #category : #nav }
SlmdView >> navigateTo: aString [

	self serverAnnounce: (CpActionRequested id: #navigate parameters: { #to -> aString } asDictionary).

]

{ #category : #utilities }
SlmdView >> shadowElementId: elementId show: aBoolean [
	| element |

	element := self findByIdInShadowDom: elementId ifNone: [ nil ].
	element ifNotNil: [
		aBoolean
			ifTrue: [ element removeStyleAt: 'display' ]
			ifFalse: [ element styleAt: 'display' put: 'none' ] ].
	"aBoolean
		ifTrue: [ element removeClass: #'smd-hidden' ]
		ifFalse: [ element addClass: #'smd-hidden' ]"

]
