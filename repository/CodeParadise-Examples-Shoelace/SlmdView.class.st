Class {
	#name : #SlmdView,
	#superclass : #CpView,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #utilities }
SlmdView >> checkElementIsNil [

	^ true
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

{ #category : #topAppBar }
SlmdView >> moveChildrenFromSlot: fromSlot to: toSlot [
	| list |

	list := self childrenAtSlotNamed: fromSlot.
	list do: [ :each | self appendChild: each atSlotNamed: toSlot ].

]

{ #category : #nav }
SlmdView >> navModalDivFind [

	"^ CpHtmlElement documentBody firstDescendantMatching: '#smdNavModalDiv'"
	^ SlmdLayoutView first findByIdInShadowDom: 'smdNavModalDiv'

]

{ #category : #nav }
SlmdView >> navModalPaneFind [
	| component |

	"^ CpHtmlElement documentBody firstDescendantMatching: '#smdNavModalPane'"
	component := SlmdNavView first.
	^ component ifNil: [ nil ] ifNotNil: [ component drawer ].
]

{ #category : #nav }
SlmdView >> navigateTo: aString [

	self serverAnnounce: (CpActionRequested id: #navigate parameters: { #to -> aString } asDictionary).

]

{ #category : #layout }
SlmdView >> settingsFind [

	^ CpHtmlElement documentBody firstDescendantMatching: '#smdSettings'

]

{ #category : #layout }
SlmdView >> settingsOpen [

	self settingsFind beOpen

]

{ #category : #topAppBar }
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
