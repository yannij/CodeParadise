Class {
	#name : #SlmdLayoutSettingsPresenter,
	#superclass : #SlmdPresenter,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #view }
SlmdLayoutSettingsPresenter >> handleViewAction: anObject [
	| aspect aspectValue |

	anObject printString traceCr.
	aspect := anObject parameterAt: #aspect.
	aspectValue := anObject parameterAt: #value.

	aspect = #layoutUpdate ifTrue: [
		self layoutUpdate: aspectValue.
		^ self ].

	self traceCr: aspect asString, ' BEFORE: ', (self model perform: aspect asSymbol) printString.
	self model perform: (aspect, ':') asSymbol with: aspectValue.
	self traceCr: aspect asString, '  AFTER: ', (self model perform: aspect asSymbol) printString.
]

{ #category : #actions }
SlmdLayoutSettingsPresenter >> layoutUpdate: props [
	| m |

	self traceCr: props printString.

	m := self model.
	props keysAndValuesDo: [ :k :v | | setAccessor |
		setAccessor := (k, ':') asSymbol.
		self traceCr: k asString, ' BEFORE: ', (m perform: k) printString.
		m perform: setAccessor with: v.
		self traceCr: k asString, '  AFTER: ', (m perform: k) printString.
		].

]

{ #category : #view }
SlmdLayoutSettingsPresenter >> viewCreated [

	super viewCreated.

	self view
		when: (CpActionRequested id: SlmdView eventIdModelUpdate) send: #handleViewAction: to: self;
		yourself.

]

{ #category : #view }
SlmdLayoutSettingsPresenter >> viewInitialized [
	| props |

	super viewInitialized.

	props := self model asProperties.
	self view
		modalDivSetUp: props;
		layoutInitialSetUp: props.

]
