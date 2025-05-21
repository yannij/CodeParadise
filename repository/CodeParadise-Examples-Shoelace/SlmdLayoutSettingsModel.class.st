Class {
	#name : #SlmdLayoutSettingsModel,
	#superclass : #SlmdModel,
	#instVars : [
		'colorThemeName',
		'fontFamily',
		'layoutWidth',
		'layoutType',
		'useAutoLayout',
		'useModalNav',
		'useTwoPaneBody',
		'navRailExpanded',
		'showAppBar',
		'showAppBarLeadingButton',
		'showNavBar',
		'showSidesheet',
		'showToolbar'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #converting }
SlmdLayoutSettingsModel >> asProperties [

	^ Dictionary new
		at: #colorThemeName put: self colorThemeName;
		at: #fontFamily put: self fontFamily;
		at: #layoutType put: self layoutType;
		at: #navRailExpanded put: self navRailExpanded;
		at: #showNavBar put: self showNavBar;
		at: #showSidesheet put: self showSidesheet;
		at: #showAppBar put: self showAppBar;
		at: #showAppBarLeadingButton put: self showAppBarLeadingButton;
		at: #showToolbar put: self showToolbar;
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
	layoutType := self layoutTypeDefault.
	useAutoLayout := true.
	useModalNav := false.
	useTwoPaneBody := true.
	navRailExpanded := false.
	showAppBar := false.
	showAppBarLeadingButton := true.
	showNavBar := false.
	showSidesheet := false.
	showToolbar := false.

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
SlmdLayoutSettingsModel >> layoutTypeDefault [

	^ #expanded
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
SlmdLayoutSettingsModel >> navRailExpanded [

	^ navRailExpanded
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> navRailExpanded: anObject [

	navRailExpanded := anObject
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> showAppBar [

	^ showAppBar
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> showAppBar: anObject [

	showAppBar := anObject
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> showAppBarLeadingButton [

	^ showAppBarLeadingButton
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> showAppBarLeadingButton: anObject [

	showAppBarLeadingButton := anObject
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> showNavBar [

	^ showNavBar
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> showNavBar: anObject [

	showNavBar := anObject
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
SlmdLayoutSettingsModel >> showToolbar [

	^ showToolbar
]

{ #category : #accessing }
SlmdLayoutSettingsModel >> showToolbar: anObject [

	showToolbar := anObject
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
