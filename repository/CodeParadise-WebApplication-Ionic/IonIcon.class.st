Class {
	#name : #IonIcon,
	#superclass : #IonElement,
	#category : #'CodeParadise-WebApplication-Ionic-Elements'
}

{ #category : #api }
IonIcon >> name [

	^ self propertyAt: #name
]

{ #category : #api }
IonIcon >> name: aString [

	self propertyAt: #name put: aString
]
