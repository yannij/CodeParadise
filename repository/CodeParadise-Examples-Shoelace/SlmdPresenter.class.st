Class {
	#name : #SlmdPresenter,
	#superclass : #CpPresenter,
	#classVars : [
		'TraceLevel'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Base'
}

{ #category : #accessing }
SlmdPresenter class >> traceLevel [

	^ TraceLevel ifNil: [ TraceLevel := 3 ]
]

{ #category : #accessing }
SlmdPresenter class >> traceLevel: anObject [
	"
	self traceLevel: 5.
	self traceLevel: 4.
	self traceLevel: 3.
	self traceLevel: 2.
	self traceLevel: 1.
	"

	^ TraceLevel := anObject
]

{ #category : #nav }
SlmdPresenter >> crud: anObject [

	self logTrace: anObject printString aspect: 'crud:' level: 3.

]

{ #category : #logging }
SlmdPresenter >> log: aString [

	self traceCr: aString
]

{ #category : #logging }
SlmdPresenter >> logError: aString [

	self log: '[Error] ', aString
]

{ #category : #logging }
SlmdPresenter >> logTrace5: aString [

	self logTrace: aString aspect: nil level: 5
]

{ #category : #logging }
SlmdPresenter >> logTrace: aString [

	self logTrace: aString aspect: nil
]

{ #category : #logging }
SlmdPresenter >> logTrace: aString aspect: aspect [

	self logTrace: aString aspect: aspect level: 3
]

{ #category : #logging }
SlmdPresenter >> logTrace: aString aspect: aspect level: level [

	self class traceLevel < level ifTrue: [
		^ self ].

	aspect
		ifNil: [ self log: aString ]
		ifNotNil: [ self log: '[', aspect, '] ', aString ]
]

{ #category : #logging }
SlmdPresenter >> logTrace: aString method: methodName [

	self logTrace: aString aspect: self class name, '>>', methodName, methodName level: 5
]

{ #category : #nav }
SlmdPresenter >> navigateTo: anObject [

	self application pane1Model handleActionRequest: anObject; valueChanged.

]

{ #category : #view }
SlmdPresenter >> viewCreated [

	self view logTrace: '' method: 'viewCreated'.
	super viewCreated
]

{ #category : #view }
SlmdPresenter >> viewInitialized [

	self view logTrace: '' method: 'viewInitialized'.
	super viewInitialized
]
