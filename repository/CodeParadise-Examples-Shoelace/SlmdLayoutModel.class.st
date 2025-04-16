Class {
	#name : #SlmdLayoutModel,
	#superclass : #SlmdModel,
	#instVars : [
		'paneLayout',
		'useTwoPaneBody'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #initialization }
SlmdLayoutModel >> initialize [

	super initialize.

	useTwoPaneBody := true.
	paneLayout := SlmdPaneLayoutModel new.

]

{ #category : #accessing }
SlmdLayoutModel >> paneLayout [

	^ paneLayout
]

{ #category : #accessing }
SlmdLayoutModel >> paneLayout: anObject [

	paneLayout := anObject
]

{ #category : #accessing }
SlmdLayoutModel >> useTwoPaneBody [

	^ useTwoPaneBody
]

{ #category : #accessing }
SlmdLayoutModel >> useTwoPaneBody: anObject [

	useTwoPaneBody := anObject
]
