Class {
	#name : #CpBrowserSpeechSynthesisUtterance,
	#superclass : #CpBrowserEventTarget,
	#category : #'CodeParadise-Browser-Support-Speech'
}

{ #category : #accessing }
CpBrowserSpeechSynthesisUtterance class >> text: aString [

	"Returns a new SpeechSynthesisUtterance object instance."

	^ self newInstanceWithArguments: { aString }
]

{ #category : #accessing }
CpBrowserSpeechSynthesisUtterance >> lang [

	"Gets and sets the language of the utterance."

	^ self propertyAt: #lang
]

{ #category : #accessing }
CpBrowserSpeechSynthesisUtterance >> lang: aString [

	"Gets and sets the language of the utterance.
	IETF language tag like en-US, en-GB, nl-NL
	See https://en.wikipedia.org/wiki/IETF_language_tag"

	self propertyAt: #lang put: aString
]

{ #category : #'event handling' }
CpBrowserSpeechSynthesisUtterance >> onBoundaryDo: aBlock [

	"Fired when the spoken utterance reaches a word or sentence boundary."

	"Add an event listener and answer the handler (a JavaScript Function).
	Use the handler to remove the listener later when no longer needed."

	^ self addEventListener: #boundary handler: aBlock
]

{ #category : #'event handling' }
CpBrowserSpeechSynthesisUtterance >> onEndDo: aBlock [

	"Fired when the utterance has finished being spoken."

	"Add an event listener and answer the handler (a JavaScript Function).
	Use the handler to remove the listener later when no longer needed."

	^ self addEventListener: #end handler: aBlock
]

{ #category : #'event handling' }
CpBrowserSpeechSynthesisUtterance >> onErrorDo: aBlock [

	"Fired when an error occurs that prevents the utterance from being successfully spoken."

	"Add an event listener and answer the handler (a JavaScript Function).
	Use the handler to remove the listener later when no longer needed."

	^ self addEventListener: #error handler: aBlock
]

{ #category : #'event handling' }
CpBrowserSpeechSynthesisUtterance >> onMarkDo: aBlock [

	"Fired when the spoken utterance reaches a named SSML ""mark"" tag."

	"Add an event listener and answer the handler (a JavaScript Function).
	Use the handler to remove the listener later when no longer needed."

	^ self addEventListener: #mark handler: aBlock
]

{ #category : #'event handling' }
CpBrowserSpeechSynthesisUtterance >> onPauseDo: aBlock [

	"Fired when the utterance is paused part way through."

	"Add an event listener and answer the handler (a JavaScript Function).
	Use the handler to remove the listener later when no longer needed."

	^ self addEventListener: #pause handler: aBlock
]

{ #category : #'event handling' }
CpBrowserSpeechSynthesisUtterance >> onResumeDo: aBlock [

	"Fired when a paused utterance is resumed."

	"Add an event listener and answer the handler (a JavaScript Function).
	Use the handler to remove the listener later when no longer needed."

	^ self addEventListener: #resume handler: aBlock
]

{ #category : #'event handling' }
CpBrowserSpeechSynthesisUtterance >> onStartDo: aBlock [

	"Fired when the utterance has begun to be spoken."

	"Add an event listener and answer the handler (a JavaScript Function).
	Use the handler to remove the listener later when no longer needed."

	^ self addEventListener: #start handler: aBlock
]

{ #category : #accessing }
CpBrowserSpeechSynthesisUtterance >> pitch [

	"Gets and sets the pitch at which the utterance will be spoken at."

	^ self propertyAt: #pitch
]

{ #category : #accessing }
CpBrowserSpeechSynthesisUtterance >> pitch: aFloat [

	"Gets and sets the pitch at which the utterance will be spoken at.
	Value between 0 and 2 (default = 1)."

	self propertyAt: #pitch put: aFloat
]

{ #category : #accessing }
CpBrowserSpeechSynthesisUtterance >> rate [

	"Gets and sets the speed at which the utterance will be spoken at."

	^ self propertyAt: #rate
]

{ #category : #accessing }
CpBrowserSpeechSynthesisUtterance >> rate: aFloat [

	"Gets and sets the speed at which the utterance will be spoken at.
	Value between 0.1 and 10 (default = 1)."

	self propertyAt: #rate put: aFloat
]

{ #category : #accessing }
CpBrowserSpeechSynthesisUtterance >> text [

	"Gets and sets the text that will be synthesized when the utterance is spoken."

	^ self propertyAt: #text
]

{ #category : #accessing }
CpBrowserSpeechSynthesisUtterance >> text: aString [

	"Gets and sets the text that will be synthesized when the utterance is spoken."

	self propertyAt: #text put: aString
]

{ #category : #accessing }
CpBrowserSpeechSynthesisUtterance >> voice [

	"Gets and sets the voice that will be used to speak the utterance."

	^ self propertyAt: #voice
]

{ #category : #accessing }
CpBrowserSpeechSynthesisUtterance >> voice: aVoice [

	"Gets and sets the voice that will be used to speak the utterance."

	self propertyAt: #voice put: aVoice
]

{ #category : #accessing }
CpBrowserSpeechSynthesisUtterance >> volume [

	"Gets and sets the volume that the utterance will be spoken at."

	^ self propertyAt: #volume
]

{ #category : #accessing }
CpBrowserSpeechSynthesisUtterance >> volume: aFloat [

	"Gets and sets the volume that the utterance will be spoken at.
	Value between 0 and 1 (default = 1)."

	self propertyAt: #volume put: aFloat
]
