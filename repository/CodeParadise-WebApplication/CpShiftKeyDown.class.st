Class {
	#name : #CpShiftKeyDown,
	#superclass : #CpModifierKeyDownCondition,
	#category : #'CodeParadise-WebApplication-Events-Custom'
}

{ #category : #accessing }
CpShiftKeyDown class >> modifierCharacter [

	^ $S
]

{ #category : #accessing }
CpShiftKeyDown class >> modifiers [

	"Answer the modifiers (an Integer, see CpEvent >> #modifiers) the receiver represents"

	^ 8
]

{ #category : #accessing }
CpShiftKeyDown class >> visualCharacter [

	^ CpClientEnvironment isPlatformMacOS
		ifTrue: [ '⇧' ]
		ifFalse: [ 'Shift' ]
]
