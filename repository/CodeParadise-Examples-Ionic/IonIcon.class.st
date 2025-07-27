Class {
	#name : #IonIcon,
	#superclass : #IonElement,
	#category : #'CodeParadise-Examples-Ionic'
}

{ #category : #api }
IonIcon >> name [

	^ self propertyAt: #name
]

{ #category : #api }
IonIcon >> name: aString [

	self propertyAt: #name put: aString
]
