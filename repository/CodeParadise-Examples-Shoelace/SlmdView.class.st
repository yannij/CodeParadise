Class {
	#name : #SlmdView,
	#superclass : #CpView,
	#classVars : [
		'TraceLevel'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Base'
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

{ #category : #'actions - nav' }
SlmdView >> doBackNav [
	| paneLayout |

	paneLayout := SlmdPaneLayoutView first.
	paneLayout ifNotNil: [
		paneLayout primaryPaneOnly ].

]

{ #category : #utilities }
SlmdView >> dropdownMenu: actionList css: cssClass [
	| menu trigger dropdown |

	menu := SlMenu new.
	menu addClass: 'smd-menu'.
	actionList do: [ :each | | icon |
		icon := (SlIcon named: (each at: #iconName)) addClass: 'smd-menu-icon'; yourself.
		menu appendChild: (SlMenuItem new
			addClass: 'smd-menu-item';
			when: CpClickEvent basicPrimary do: [ self executeNavAction: each ] for: self;
			prefix: icon;
			textContent: (each at: #iconLabel);
			yourself) ].

	trigger := #div asHtmlTag
		appendChild: ((SlIconButton named: 'three-dots-vertical') addClass: 'smd-toolbar-icon'; yourself);
		yourself.
	cssClass ifNotNil: [ trigger addClass: cssClass ].

	dropdown := SlDropdown new
		replaceAllChildrenWith: trigger atSlotNamed: #trigger;
		appendChild: menu;
		yourself.

	^ dropdown

]

{ #category : #utilities }
SlmdView >> element: element show: aBoolean [

	element ifNotNil: [
		aBoolean
			ifTrue: [ element removeStyleAt: 'display' ]
			ifFalse: [ element styleAt: 'display' put: 'none' ] ].
	"aBoolean
		ifTrue: [ element removeClass: #'smd-hidden' ]
		ifFalse: [ element addClass: #'smd-hidden' ]"

]

{ #category : #'actions - nav' }
SlmdView >> executeNavAction: aNavAction [
	| navId arg1 |

	self logTrace: aNavAction printString aspect: 'executeNavAction:' level: 3.

	navId := aNavAction at: #id.
	navId = #settings ifTrue: [
		^ self modalSettingsOpen ].
	navId = #modalNavButton ifTrue: [
		^ self modalNavOpen ].
	navId = #backNavButton ifTrue: [
		^ self doBackNav ].

	arg1 := aNavAction at: #arg1.
	(aNavAction at: #actionName) = #crud ifTrue: [
		arg1 = 'update' ifTrue: [
			^ TBPostView first setEditable: true ].
		^ self serverAnnounce: (CpActionRequested id: #crud parameters: { #to -> arg1 } asDictionary) ].

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
SlmdView >> findFirstDescendantInShadowDom: anId [

	^ self
		findFirstDescendantInShadowDom: anId
		ifNone: [ self error: '#findFirstDescendantInShadowDom: ', anId asString, ' is nil' ].
]

{ #category : #utilities }
SlmdView >> findFirstDescendantInShadowDom: anId ifNone: aBlock [
	| element |

	element := self shadowedFirstDescendantMatching: anId.
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

{ #category : #'find element' }
SlmdView >> layoutViewFind [

	^ SlmdResponsiveLayoutView first
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

	self logTrace: aString aspect: self class name, '>>', methodName level: 5
]

{ #category : #logging }
SlmdView >> logTraceAnnouncement: aString [

	self logTrace: aString aspect: 'Announcement' level: 3
]

{ #category : #'find element' }
SlmdView >> modalDivFind [
	"Locate the div where modal components can attach"

	^ SlmdResponsiveLayoutView first findByIdInShadowDom: 'smdModalDiv'

]

{ #category : #'find element' }
SlmdView >> modalNavElementOrNil [
	| component |

	component := SlmdNavRailView first.
	^ component ifNil: [ nil ] ifNotNil: [ component drawer ].
]

{ #category : #'actions - toolbar' }
SlmdView >> modalNavOpen [
	| drawer |

	drawer := self modalNavElementOrNil.
	drawer
		ifNil: [ self logError: 'modal nav element is nil' ]
		ifNotNil: [ drawer show ]
]

{ #category : #'find element' }
SlmdView >> modalSettingsElement [
	| component |

	component := SlmdLayoutSettingsView first.
	^ component ifNil: [ self error: 'Not found: layout settings view' ] ifNotNil: [ component drawer ].
]

{ #category : #'actions - toolbar' }
SlmdView >> modalSettingsOpen [

	self logTrace: 'modalSettingsOpen'.
	self modalSettingsElement beOpen

]

{ #category : #utilities }
SlmdView >> moveChildrenFromSlot: fromSlot to: toSlot [
	| list |

	list := self childrenAtSlotNamed: fromSlot.
	list do: [ :each | self appendChild: each atSlotNamed: toSlot ].

]

{ #category : #'actions - nav' }
SlmdView >> navigateTo: aString [

	self serverAnnounce: (CpActionRequested id: #navigate parameters: { #to -> aString } asDictionary).

]

{ #category : #utilities }
SlmdView >> shadowElementId: elementId show: aBoolean [
	| element |

	element := self findByIdInShadowDom: elementId ifNone: [ nil ].
	self element: element show: aBoolean.

]

{ #category : #utilities }
SlmdView >> shadowFirstDescendantMatching: cssSelectorString show: aBoolean [
	| element |

	element := self shadowedFirstDescendantMatching: cssSelectorString.
	self element: element show: aBoolean.

]
