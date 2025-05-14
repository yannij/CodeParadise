Class {
	#name : #SlmdLayoutModel,
	#superclass : #SlmdModel,
	#instVars : [
		'layoutSettings',
		'paneLayout',
		'twoPaneSplitPosition',
		'navRail',
		'navBar',
		'toolbar'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #initialization }
SlmdLayoutModel >> initialize [

	super initialize.

	layoutSettings := SlmdLayoutSettingsModel new.
	twoPaneSplitPosition := 300.
	paneLayout := SlmdPaneLayoutModel new.
	navRail := SlmdNavRailModel new.
	navBar := SlmdNavBarModel new.
	toolbar := SlmdToolbarModel new.

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
SlmdLayoutModel >> navBar [

	^ navBar
]

{ #category : #accessing }
SlmdLayoutModel >> navBar: anObject [

	navBar := anObject
]

{ #category : #accessing }
SlmdLayoutModel >> navRail [

	^ navRail
]

{ #category : #accessing }
SlmdLayoutModel >> navRail: anObject [

	navRail := anObject
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
SlmdLayoutModel >> toolbar [

	^ toolbar
]

{ #category : #accessing }
SlmdLayoutModel >> toolbar: anObject [

	toolbar := anObject
]

{ #category : #accessing }
SlmdLayoutModel >> twoPaneSplitPosition [

	^ twoPaneSplitPosition
]

{ #category : #accessing }
SlmdLayoutModel >> twoPaneSplitPosition: anObject [

	twoPaneSplitPosition := anObject
]
