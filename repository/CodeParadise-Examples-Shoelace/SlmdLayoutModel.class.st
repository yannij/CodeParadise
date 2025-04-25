Class {
	#name : #SlmdLayoutModel,
	#superclass : #SlmdModel,
	#instVars : [
		'paneLayout',
		'twoPaneSplitPosition'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #initialization }
SlmdLayoutModel >> initialize [

	super initialize.

	twoPaneSplitPosition := 300.
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
SlmdLayoutModel >> twoPaneSplitPosition [

	^ twoPaneSplitPosition
]

{ #category : #accessing }
SlmdLayoutModel >> twoPaneSplitPosition: anObject [

	twoPaneSplitPosition := anObject
]
