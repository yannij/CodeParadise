Class {
	#name : #SlmdView,
	#superclass : #CpView,
	#classVars : [
		'TraceLevel'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #accessing }
SlmdView class >> eventIdModelUpdate [

	^ #modelUpdate
]

{ #category : #accessing }
SlmdView class >> traceLevel [

	^ TraceLevel ifNil: [ TraceLevel := 3 ]
]

{ #category : #accessing }
SlmdView class >> traceLevel: anObject [

	^ TraceLevel := anObject
]

{ #category : #events }
SlmdView >> announceAspect: key value: anObject [

	self announceEvent: self class eventIdModelUpdate key: key value: anObject
]

{ #category : #events }
SlmdView >> announceEvent: id key: key value: anObject [

	self logTraceAnnouncement: id printString, ': ', key printString, ' -> ', anObject printString.

	self serverAnnounce: (CpActionRequested
		id: id
		parameters: {
			#aspect -> key.
			#value -> anObject
		} asDictionary).
]

{ #category : #nav }
SlmdView >> executeNavAction: aNavAction [
	| navId arg1 |

	navId := aNavAction at: #id.
	navId = #settings ifTrue: [
		^ self modalSettingsOpen ].
	navId = #modalNavButton ifTrue: [
		^ self modalNavOpen ].

	arg1 := aNavAction at: #arg1.
	self navigateTo: arg1.

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
SlmdView >> iconButtonForAction: aNavAction css: cssClass [
	| iconName tag |

	iconName := aNavAction at: #iconName.

	tag := #div asHtmlTag
		when: CpClickEvent basicPrimary do: [ self executeNavAction: aNavAction ] for: self;
		appendChild: ((SlIconButton named: iconName) addClass: 'smd-toolbar-icon'; yourself);
		yourself.

	cssClass ifNotNil: [ tag addClass: cssClass ].

	^ tag
]

{ #category : #utilities }
SlmdView >> layoutViewFind [

	^ SlmdLayoutView first
]

{ #category : #logging }
SlmdView >> log: aString [

	self traceCr: aString
]

{ #category : #logging }
SlmdView >> logError: aString [

	self log: '[Error] ', aString
]

{ #category : #logging }
SlmdView >> logTrace5: aString [

	self logTrace: aString aspect: nil level: 5
]

{ #category : #logging }
SlmdView >> logTrace: aString [

	self logTrace: aString aspect: nil
]

{ #category : #logging }
SlmdView >> logTrace: aString aspect: aspect [

	self logTrace: aString aspect: aspect level: 3
]

{ #category : #logging }
SlmdView >> logTrace: aString aspect: aspect level: level [

	self class traceLevel < level ifTrue: [
		^ self ].

	aspect
		ifNil: [ self log: aString ]
		ifNotNil: [ self log: '[', aspect, '] ', aString ]
]

{ #category : #logging }
SlmdView >> logTrace: aString method: methodName [

	self logTrace: aString aspect: self class name, '>>', methodName
]

{ #category : #logging }
SlmdView >> logTraceAnnouncement: aString [

	self logTrace: aString aspect: 'Announcement'
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

{ #category : #nav }
SlmdView >> modalNavOpen [
	| drawer |

	drawer := self modalNavElementOrNil.
	drawer
		ifNil: [ self logError: 'modal nav element is nil' ]
		ifNotNil: [ drawer show ]
]

{ #category : #settings }
SlmdView >> modalSettingsElement [
	| component |

	component := SlmdLayoutSettingsView first.
	^ component ifNil: [ self error: 'Not found: layout settings view' ] ifNotNil: [ component drawer ].
]

{ #category : #settings }
SlmdView >> modalSettingsOpen [

	self logTrace: '' method: 'modalSettingsOpen'.
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
