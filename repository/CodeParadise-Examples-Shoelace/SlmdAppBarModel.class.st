Class {
	#name : #SlmdAppBarModel,
	#superclass : #SlmdToolbarModel,
	#instVars : [
		'primary'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #accessing }
SlmdAppBarModel >> bePrimary [

	self primary: true
]

{ #category : #accessing }
SlmdAppBarModel >> beSecondary [

	self primary: false
]

{ #category : #initialization }
SlmdAppBarModel >> initialize [

	super initialize.

	primary := true.

]

{ #category : #testing }
SlmdAppBarModel >> isPrimary [

	^ self primary = true
]

{ #category : #testing }
SlmdAppBarModel >> isSecondary [

	^ self isPrimary not
]

{ #category : #accessing }
SlmdAppBarModel >> primary [

	^ primary
]

{ #category : #accessing }
SlmdAppBarModel >> primary: anObject [

	primary := anObject
]
