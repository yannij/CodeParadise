Class {
	#name : #SlmdLayoutModel,
	#superclass : #SlmdModel,
	#instVars : [
		'layoutSettings',
		'paneLayout',
		'twoPaneSplitPosition',
		'navRail',
		'navBar',
		'dockedToolbar',
		'floatingToolbar'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #accessing }
SlmdLayoutModel >> dockedToolbar [

	^ dockedToolbar
]

{ #category : #accessing }
SlmdLayoutModel >> dockedToolbar: anObject [

	dockedToolbar := anObject
]

{ #category : #accessing }
SlmdLayoutModel >> floatingToolbar [

	^ floatingToolbar
]

{ #category : #accessing }
SlmdLayoutModel >> floatingToolbar: anObject [

	floatingToolbar := anObject
]

{ #category : #initialization }
SlmdLayoutModel >> initialize [

	super initialize.

	layoutSettings := SlmdLayoutSettingsModel new.
	twoPaneSplitPosition := 300.
	paneLayout := SlmdPaneLayoutModel new.
	navRail := SlmdNavRailModel new.
	navBar := SlmdNavBarModel new.
	dockedToolbar := SlmdDockedToolbarModel new.
	floatingToolbar := SlmdFloatingToolbarModel new.

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
SlmdLayoutModel >> twoPaneSplitPosition [

	^ twoPaneSplitPosition
]

{ #category : #accessing }
SlmdLayoutModel >> twoPaneSplitPosition: anObject [

	twoPaneSplitPosition := anObject
]
