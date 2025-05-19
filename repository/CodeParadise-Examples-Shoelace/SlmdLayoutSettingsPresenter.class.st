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

	"aspect = #aspect" true ifTrue: [
		self traceCr: aspect asString, ': ', (self model perform: aspect asSymbol) printString.
		self model perform: (aspect, ':') asSymbol with: aspectValue.
		self traceCr: aspect asString, ': ', (self model perform: aspect asSymbol) printString.
		^ self ].

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
