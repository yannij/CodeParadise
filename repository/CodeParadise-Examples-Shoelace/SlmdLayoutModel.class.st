Class {
	#name : #SlmdLayoutModel,
	#superclass : #SlmdModel,
	#instVars : [
		'paneLayout',
		'twoPaneSplitPosition',
		'bottomAppBar'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #accessing }
SlmdLayoutModel >> bottomAppBar [

	^ bottomAppBar
]

{ #category : #accessing }
SlmdLayoutModel >> bottomAppBar: anObject [

	bottomAppBar := anObject
]

{ #category : #initialization }
SlmdLayoutModel >> initialize [

	super initialize.

	twoPaneSplitPosition := 300.
	paneLayout := SlmdPaneLayoutModel new.
	bottomAppBar := SlmdBottomAppBarModel new.
	self setBottomAppBar.

]

{ #category : #accessing }
SlmdLayoutModel >> paneLayout [

	^ paneLayout
]

{ #category : #accessing }
SlmdLayoutModel >> paneLayout: anObject [

	paneLayout := anObject
]

{ #category : #initialization }
SlmdLayoutModel >> setBottomAppBar [

	self bottomAppBar
		iconButtons: {'1-circle'. '2-circle' . '3-circle'. '4-circle'};
		fab: 'plus'.

]

{ #category : #accessing }
SlmdLayoutModel >> twoPaneSplitPosition [

	^ twoPaneSplitPosition
]

{ #category : #accessing }
SlmdLayoutModel >> twoPaneSplitPosition: anObject [

	twoPaneSplitPosition := anObject
]
