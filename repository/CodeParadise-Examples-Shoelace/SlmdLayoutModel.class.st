Class {
	#name : #SlmdLayoutModel,
	#superclass : #SlmdModel,
	#instVars : [
		'layoutSettings',
		'paneLayout',
		'twoPaneSplitPosition',
		'nav',
		'bottomAppBar'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #defaults }
SlmdLayoutModel class >> layoutTypeDefault [

	^ #expanded
]

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

	layoutSettings := SlmdLayoutSettingsModel new.
	twoPaneSplitPosition := 300.
	paneLayout := SlmdPaneLayoutModel new.
	nav := SlmdNavModel new.
	bottomAppBar := SlmdBottomAppBarModel new.

]

{ #category : #accessing }
SlmdLayoutModel >> layoutSettings [

	^ layoutSettings
]

{ #category : #accessing }
SlmdLayoutModel >> layoutSettings: anObject [

	layoutSettings := anObject
]

{ #category : #accessing }
SlmdLayoutModel >> nav [

	^ nav
]

{ #category : #accessing }
SlmdLayoutModel >> nav: anObject [

	nav := anObject
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
