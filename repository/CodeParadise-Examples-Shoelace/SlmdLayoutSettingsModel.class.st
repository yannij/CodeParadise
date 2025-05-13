Class {
	#name : #SlmdLayoutSettingsModel,
	#superclass : #SlmdModel,
	#instVars : [
		'layoutWidth',
		'layoutType',
		'navType',
		'showBottomAppBar',
		'showSidesheet',
		'useAutoLayout',
		'useModalNav',
		'useTwoPaneBody',
		'colorThemeName',
		'fontFamily'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #converting }
SlmdLayoutSettingsModel >> asProperties [

	^ Dictionary new
		at: #colorThemeName put: self colorThemeName;
		at: #fontFamily put: self fontFamily;
		at: #layoutType put: self layoutType;
		at: #navType put: self navType;
		at: #showBottomAppBar put: self showBottomAppBar;
		at: #showSidesheet put: self showSidesheet;
		at: #useAutoLayout put: self useAutoLayout;
		at: #useModalNav put: self useModalNav;
		at: #useTwoPaneBody put: self useTwoPaneBody;
		yourself
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> colorThemeName [

	^ colorThemeName
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> colorThemeName: anObject [

	colorThemeName := anObject
]

{ #category : #'color theme' }
SlmdLayoutSettingsModel >> defaultColorThemeName [

	^ #lime
]

{ #category : #typography }
SlmdLayoutSettingsModel >> defaultFontFamily [

	^ #'var(--sl-font-mono)'
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> fontFamily [

	^ fontFamily
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> fontFamily: anObject [

	fontFamily := anObject
]

{ #category : #initialization }
SlmdLayoutSettingsModel >> initialize [

	super initialize.

	colorThemeName := self defaultColorThemeName.
	fontFamily := self defaultFontFamily.
	layoutType := SlmdLayoutModel layoutTypeDefault.
	navType := SlmdNavModel navTypeDefault.
	showBottomAppBar := false.
	showSidesheet := false.
	useAutoLayout := true.
	useModalNav := false.
	useTwoPaneBody := true.

]

{ #category : #accessing }
SlmdLayoutSettingsModel >> layoutType [

	^ layoutType
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> layoutType: anObject [

	layoutType := anObject
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> layoutWidth [

	^ layoutWidth
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> layoutWidth: anObject [

	layoutWidth := anObject
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> navType [

	^ navType
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> navType: anObject [

	navType := anObject
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> showBottomAppBar [

	^ showBottomAppBar
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> showBottomAppBar: anObject [

	showBottomAppBar := anObject
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> showSidesheet [

	^ showSidesheet
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> showSidesheet: anObject [

	showSidesheet := anObject
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> useAutoLayout [

	^ useAutoLayout
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> useAutoLayout: anObject [

	useAutoLayout := anObject
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> useModalNav [

	^ useModalNav
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> useModalNav: anObject [

	useModalNav := anObject
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> useTwoPaneBody [

	^ useTwoPaneBody
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> useTwoPaneBody: anObject [

	useTwoPaneBody := anObject
]
