Class {
	#name : #SlmdLayoutView,
	#superclass : #SlmdView,
	#instVars : [
		'debounceTransition',
		'layoutSettingsView',
		'layoutWidthCached',
		'navActions',
		'actionItems'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #'class initialization' }
SlmdLayoutView class >> beLoaded [

	CpTransition beLoaded.

]

{ #category : #'web resources' }
SlmdLayoutView class >> globalStyle [
	<webResource: #css>

	^ '
.smd-hidden {
  display: none;
}

.smd-menu {
  padding: 8px 0;
}

.smd-menu-item::part(base) {
  padding: 0;
}

.smd-menu-item::part(checked-icon) {
  display: none;
}

.smd-menu-item::part(prefix) {
  padding: 0;
}

.smd-menu-item::part(label) {
  padding: 8px 0;
}

.smd-menu-item {
  padding: 0;
  height: 48px;
  min-width: 112px;
  max-width: 280px;
}

.smd-menu-icon {
  padding: 12px;
  font-size: 24px;
  margin-inline-end: 0;
}
'

]

{ #category : #accessing }
SlmdLayoutView class >> layoutTypeCompact [

	^ #compact
]

{ #category : #accessing }
SlmdLayoutView class >> layoutTypeExpanded [

	^ #expanded
]

{ #category : #accessing }
SlmdLayoutView class >> layoutTypeExtraLarge [

	^ #'extra-large'
]

{ #category : #accessing }
SlmdLayoutView class >> layoutTypeLarge [

	^ #large
]

{ #category : #accessing }
SlmdLayoutView class >> layoutTypeList [

	^ {
	self layoutTypeCompact -> 'Compact'.
	self layoutTypeMedium -> 'Medium'.
	self layoutTypeExpanded -> 'Expanded'.
	self layoutTypeLarge -> 'Large'.
	self layoutTypeExtraLarge -> 'Extra-large'.
	}
]

{ #category : #accessing }
SlmdLayoutView class >> layoutTypeMedium [

	^ #medium
]

{ #category : #'web resources' }
SlmdLayoutView class >> style [

	<webResource: #css>

	^ '
.smd-layout {
  background: var(--sl-color-primary-100);
}

.smd-settings-pane {
  padding: 0;
  overflow-y: auto;
}

.smd-body-region {
  flex: auto;
  display: flex;  
  flex-direction: row;
  background: var(--sl-color-primary-100);
}
'
, SlmdNavRailView styleNav

]

{ #category : #'web resources' }
SlmdLayoutView class >> template [

	<webResource: #html>

	^ '
<div id="container" class="smd-layout">
  <div style="display: flex; flex-direction: column">
    <div style="height: 100%; flex: 1; display: flex; flex-direction: row">
      <div id="smdNavRegion" class="smd-navRegion">
        <slot name="navRegion">
        </slot>
      </div>
      <div id="smdBodyRegion" class="smd-body-region">
        <div style="flex: 100%">
          <slot name="paneLayout"></slot>
        </div>
      </div>
      <div id="smdSidesheet">
        <slot name="sidesheet"></slot>
      </div>
    </div>
    <footer id="smdNavBar">
      <slot name="navBar"></slot>
    </footer>
    <footer id="smdDockedToolbar">
      <slot name="dockedToolbar"></slot>
    </footer>
    <div id="smdFloatingToolbar">
      <slot name="floatingToolbar"></slot>
    </div>
  </div>
  <div id="smdModalDiv"></div>
</div>
'
]

{ #category : #accessing }
SlmdLayoutView >> actionItems [

	^ actionItems
]

{ #category : #accessing }
SlmdLayoutView >> actionItems: anObject [

	actionItems := anObject
]

{ #category : #events }
SlmdLayoutView >> addActionItemId: id key: key value: value [
	| item |

	(actionItems includesKey: id) ifFalse: [
		actionItems at: id put: Dictionary new ].
	item := actionItems at: id.
	item at: key put: value
]

{ #category : #events }
SlmdLayoutView >> addNavAction: props [

	navActions at: (props at: #id) put: props
]

{ #category : #body }
SlmdLayoutView >> adjustBodyHeight [
	| bodyRegion bodyHeight |

	bodyRegion := self bodyRegionFind.
	bodyRegion ifNil: [ ^ self  ].

	bodyHeight := (self showNavBar or: [ self showDockedToolbar ])
		ifTrue: [ 'calc(100vh - 64px)' ]
		ifFalse: [ '100vh' ].
	bodyRegion styleAt: 'height' put: bodyHeight.
	bodyRegion styleAt: 'max-height' put: bodyHeight.
]

{ #category : #body }
SlmdLayoutView >> appBarDisplay: anObject [
	| components |

	self logTrace: anObject printString method: 'appBarDisplay:'.
	components := SlmdAppBarView all.
	self logTrace: components printString method: 'appBarDisplay:'.

	components do: [ :each |
		self logTrace: each printString method: 'appBarDisplay:'.
		each appBarDisplay: anObject ].

]

{ #category : #body }
SlmdLayoutView >> appBarLeadingButtonDisplay: anObject [
	| components |

	components := SlmdAppBarView all.
	components ifEmpty: [ self logError: 'appBarMenuDisplay: - No App bar found' ].

	components do: [ :each |
		each isPrimary ifTrue: [
			each appBarLeadingButtonDisplay: anObject ] ].

]

{ #category : #layout }
SlmdLayoutView >> applyLayoutProfile: props [

	self navRailExpandedAdapt: (props at: #navRailExpanded ifAbsent: [ false ]).
	self showNavMenuButtonAdapt: (props at: #showNavMenuButton ifAbsent: [ false ]).
	self useModalNavAdapt: (props at: #useModalNav ifAbsent: [ false ]).
	self showNavBarAdapt: (props at: #showNavBar ifAbsent: [ false ]).
	self useTwoPaneBodyAdapt: (props at: #useTwoPaneBody ifAbsent: [ false ]).
	self showSidesheetAdapt: (props at: #showSidesheet ifAbsent: [ false ]).
	self showAppBarAdapt: (props at: #showAppBar ifAbsent: [ false ]).
	self showDockedToolbarAdapt: (props at: #showDockedToolbar ifAbsent: [ false ]).
	self showFloatingToolbarAdapt: (props at: #showFloatingToolbar ifAbsent: [ false ]).

	self adjustBodyHeight.

]

{ #category : #body }
SlmdLayoutView >> bodyFind [

	"^ self lastAncestorMatching: 'body'"
	^ CpHtmlElement documentBody
]

{ #category : #body }
SlmdLayoutView >> bodyRegionFind [

	^ self findByIdInShadowDom: 'smdBodyRegion'
]

{ #category : #body }
SlmdLayoutView >> bodySplitPanelAdapt [
	| paneLayout w |

	paneLayout := SlmdPaneLayoutView first.
	w := self pane1WidthCompute.

	paneLayout ifNotNil: [
		paneLayout pane1WidthSet: w ].

]

{ #category : #'color theme' }
SlmdLayoutView >> colorThemeAdapt: aColorName [

	self logTrace: aColorName printString method: 'colorThemeAdapt:'.
	aColorName ifNil: [ ^ self ].
	self updateGlobalStyle.

]

{ #category : #'color theme' }
SlmdLayoutView >> colorThemeFrom: base on: aStream [

	#('50' '100' '200' '300' '400' '500' '600' '700' '800' '900' '950') do: [ :each |
		aStream
			nextPutAll: '--sl-color-primary-';
			nextPutAll: each;
			nextPutAll: ': var(--sl-color-', base, '-';
			nextPutAll: each;
			nextPutAll: ');';
			yourself ].

]

{ #category : #'accessing - settings' }
SlmdLayoutView >> colorThemeName [

	^ self layoutSettingsView colorThemeName
]

{ #category : #layout }
SlmdLayoutView >> debounceResizeEvent: anEvent [

	"If a running debounce transition is available, we're done"
	(debounceTransition isNotNil and: [ debounceTransition isRunning ])
		ifTrue: [ ^ self ].

	"Create new debounce transition, run it once"
	debounceTransition
		ifNotNil: [ debounceTransition stop ]
		ifNil: [
			debounceTransition := (CpTransition onBlock: [ self handleResizeEvent: anEvent ])
				duration: 0 "Execute once" ].

	"Set timeout for the debounce"
	debounceTransition startDelayedBy: 100.
]

{ #category : #typography }
SlmdLayoutView >> fontFamilyAdapt: aFontFamily [
	| element |

	aFontFamily ifNil: [ ^ self ].
	"aFontFamily = self fontFamily ifTrue: [ ^ self ]."

	element := self bodyFind.
	element ifNil: [ ^ self ].

	element styleAt: 'font-family' put: aFontFamily

]

{ #category : #layout }
SlmdLayoutView >> handleResizeEvent: anEvent [
	| newWidth |

	debounceTransition := nil.

	anEvent detail valuesDo: [ :eachDetail |
		eachDetail do: [ :eachEntry |
			| rect |
			rect := eachEntry apply: 'contentRect'.
			newWidth := rect apply: 'width'
			"Don't bother with height. It seems to report 0. Probably no browser support"
			"height := rect apply: 'height'." ] ].

	layoutWidthCached = newWidth ifTrue: [
		^ self ].

	layoutWidthCached := newWidth.
	self bodySplitPanelAdapt.
	self useAutoLayout not ifTrue: [
		^ self ].

	self layoutAdaptToWidth
]

{ #category : #initialization }
SlmdLayoutView >> initialize [

	super initialize.

	layoutWidthCached := 0.
	navActions := Dictionary new.
	actionItems := Dictionary new.

]

{ #category : #layout }
SlmdLayoutView >> layoutAdaptToWidth [

	layoutWidthCached < 600 ifTrue: [
		^ self layoutTypeAdapt: self class layoutTypeCompact ].

	layoutWidthCached < 840 ifTrue: [
		^ self layoutTypeAdapt: self class layoutTypeMedium ].

	layoutWidthCached < 1200 ifTrue: [
		^ self layoutTypeAdapt: self class layoutTypeExpanded ].

	layoutWidthCached < 1600 ifTrue: [
		^ self layoutTypeAdapt: self class layoutTypeLarge ].

	self layoutTypeAdapt: self class layoutTypeExtraLarge.

]

{ #category : #initialization }
SlmdLayoutView >> layoutInitialSetUp: props [
	"Invoked by presenter's viewCreated"

	self logTrace: props printString method: 'layoutInitialSetUp:'.
	self resizeSetUp.

	self colorThemeAdapt: (props at: #colorThemeName ifAbsent: []).
	self fontFamilyAdapt: (props at: #fontFamily ifAbsent: []).

	(props at: #useAutoLayout ifAbsent: [ true ]) ifTrue: [
		self layoutAdaptToWidth.
		^ self ].

	self applyLayoutProfile: props.

]

{ #category : #layout }
SlmdLayoutView >> layoutProfileCompact [

	^ {
		#navRailExpanded -> false.
		#showNavMenuButton -> false.
		#useModalNav -> true.
		#showNavBar -> true.
		#useTwoPaneBody -> false.
		#showSidesheet -> false.
		#showAppBar -> true.
		#showDockedToolbar -> false.
		#showFloatingToolba -> false
	} asDictionary

]

{ #category : #layout }
SlmdLayoutView >> layoutProfileExpanded [

	^ {
		#navRailExpanded -> false.
		#showNavMenuButton -> true.
		#useModalNav -> true.
		#showNavBar -> false.
		#useTwoPaneBody -> true.
		#showSidesheet -> false.
		#showAppBar -> true.
		#showDockedToolbar -> false.
		#showFloatingToolba -> false
	} asDictionary

]

{ #category : #layout }
SlmdLayoutView >> layoutProfileExtraLarge [

	^ {
		#navRailExpanded -> true.
		#showNavMenuButton -> false.
		#useModalNav -> false.
		#showNavBar -> false.
		#useTwoPaneBody -> true.
		#showSidesheet -> true.
		#showAppBar -> true.
		#showDockedToolbar -> false.
		#showFloatingToolba -> false
	} asDictionary

]

{ #category : #layout }
SlmdLayoutView >> layoutProfileLarge [

	^ {
		#navRailExpanded -> false.
		#showNavMenuButton -> false.
		#useModalNav -> false.
		#showNavBar -> false.
		#useTwoPaneBody -> true.
		#showSidesheet -> false.
		#showAppBar -> true.
		#showDockedToolbar -> false.
		#showFloatingToolba -> false
	} asDictionary

]

{ #category : #layout }
SlmdLayoutView >> layoutProfileMedium [

	^ {
		#navRailExpanded -> true.
		#showNavMenuButton -> false.
		#useModalNav -> true.
		#showNavBar -> true.
		#useTwoPaneBody -> true.
		#showSidesheet -> false.
		#showAppBar -> true.
		#showDockedToolbar -> false.
		#showFloatingToolba -> false
	} asDictionary

]

{ #category : #accessing }
SlmdLayoutView >> layoutSettingsView [

	layoutSettingsView ifNil: [
		layoutSettingsView := SlmdLayoutSettingsView first ]
.
	^ layoutSettingsView
]

{ #category : #accessing }
SlmdLayoutView >> layoutSettingsView: anObject [

	layoutSettingsView := anObject
]

{ #category : #'accessing - settings' }
SlmdLayoutView >> layoutType [

	^ self layoutSettingsView layoutType

]

{ #category : #'accessing - settings' }
SlmdLayoutView >> layoutType: anObject [

	self layoutSettingsView layoutType: anObject
]

{ #category : #layout }
SlmdLayoutView >> layoutTypeAdapt: aLayoutType [
	| props |

	self logTrace: aLayoutType printString method: 'layoutTypeAdapt:'.

	aLayoutType = self class layoutTypeCompact ifTrue: [
		props := self layoutProfileCompact ].
	aLayoutType = self class layoutTypeMedium ifTrue: [
		props := self layoutProfileMedium ].
	aLayoutType = self class layoutTypeExpanded ifTrue: [
		props := self layoutProfileExpanded ].
	aLayoutType = self class layoutTypeLarge ifTrue: [
		props := self layoutProfileLarge ].
	aLayoutType = self class layoutTypeExtraLarge ifTrue: [
		props := self layoutProfileExtraLarge ].

	props ifNil: [ ^ self ].
	self layoutType: aLayoutType.
	self setLayoutSettings: props.
	self applyLayoutProfile: props.
	self layoutSettingsView layoutUpdate.

]

{ #category : #accessing }
SlmdLayoutView >> layoutWidthCached [

	^ layoutWidthCached
]

{ #category : #accessing }
SlmdLayoutView >> layoutWidthCached: anObject [

	layoutWidthCached := anObject
]

{ #category : #accessing }
SlmdLayoutView >> navActions [

	^ navActions
]

{ #category : #accessing }
SlmdLayoutView >> navActions: anObject [

	navActions := anObject
]

{ #category : #navbar }
SlmdLayoutView >> navBarDisplay: aBoolean [

	self shadowElementId: 'smdNavBar' show: aBoolean

]

{ #category : #'accessing - settings' }
SlmdLayoutView >> navRailExpanded [

	^ self layoutSettingsView navRailExpanded
]

{ #category : #'accessing - settings' }
SlmdLayoutView >> navRailExpanded: anObject [

	self layoutSettingsView navRailExpanded: anObject
]

{ #category : #navrail }
SlmdLayoutView >> navRailExpandedAdapt: aBoolean [
	| modalElement navComponent |

	self logTrace: aBoolean printString method: 'navRailExpandedAdapt:'.

	"Set type in nav view"
	navComponent := SlmdNavRailView first.
	navComponent ifNotNil: [ navComponent navRailExpanded: aBoolean ].

	self navRegionFind
		styleAt: 'flex'
		put: '0 0 ', self navRailWidth printString, 'px'.

	modalElement := self modalNavElementOrNil.
	modalElement ifNotNil: [
		modalElement customPropertyAt: 'size' put: self navRailWidth printString, 'px'.
		"SlmdNavRailView first navSetUp" ].

	self bodySplitPanelAdapt.

]

{ #category : #navrail }
SlmdLayoutView >> navRailWidth [

	^ SlmdNavRailView first navRailWidth
]

{ #category : #navrail }
SlmdLayoutView >> navRegionDisplay: aBoolean [
	| element |

	element := self navRegionFind.
	element ifNotNil: [
		aBoolean
			ifTrue: [ element removeStyleAt: 'display' ]
			ifFalse: [ element styleAt: 'display' put: 'none' ] ].

]

{ #category : #navrail }
SlmdLayoutView >> navRegionFind [

	"^ CpHtmlElement documentBody firstDescendantMatching: '#smdNavRegion'"
	^ self shadowedElementWithId: 'smdNavRegion'
]

{ #category : #body }
SlmdLayoutView >> pane1WidthCompute [
	| w |

	w := (self layoutWidthCached / 2) asInteger.
	self useModalNav ifFalse: [  w := w - self navRailWidth ].
	w < self pane1WidthMin ifTrue: [ w := self pane1WidthMin ].
	^ w
]

{ #category : #body }
SlmdLayoutView >> pane1WidthMin [

	^ 300
]

{ #category : #layout }
SlmdLayoutView >> resizeSetUp [

	| target div resize |
	target := self shadowedElementWithId: 'container'.
	div := target firstChild.
	resize := SlResizeObserver new.
	resize when: SlResizeEvent send: #debounceResizeEvent: to: self.
	target replaceChild: div with: resize.
	resize appendChild: div
]

{ #category : #body }
SlmdLayoutView >> secondaryPaneOnly [
	| component |

	component := SlmdPaneLayoutView first.
	component ifNotNil: [
		component secondaryPaneOnly ].

]

{ #category : #layout }
SlmdLayoutView >> setLayoutSettings: props [

	self navRailExpanded: (props at: #navRailExpanded ifAbsent: [ false ]).
	self showNavMenuButton: (props at: #showNavMenuButton ifAbsent: [ false ]).
	self useModalNav: (props at: #useModalNav ifAbsent: [ false ]).
	self showNavBar: (props at: #showNavBar ifAbsent: [ false ]).
	self useTwoPaneBody: (props at: #useTwoPaneBody ifAbsent: [ false ]).
	self showSidesheet: (props at: #showSidesheet ifAbsent: [ false ]).
	self showAppBar: (props at: #showAppBar ifAbsent: [ false ]).
	self showDockedToolbar: (props at: #showDockedToolbar ifAbsent: [ false ]).
	self showFloatingToolbar: (props at: #showFloatingToolbar ifAbsent: [ false ]).

]

{ #category : #'accessing - settings' }
SlmdLayoutView >> showAppBar [

	^ self layoutSettingsView showAppBar
]

{ #category : #'accessing - settings' }
SlmdLayoutView >> showAppBar: anObject [

	self layoutSettingsView showAppBar: anObject
]

{ #category : #toolbar }
SlmdLayoutView >> showAppBarAdapt: aBoolean [

	self logTrace: aBoolean printString method: 'showAppBarAdapt:'.

	self appBarDisplay: aBoolean.

]

{ #category : #'accessing - settings' }
SlmdLayoutView >> showDockedToolbar [

	^ self layoutSettingsView showDockedToolbar
]

{ #category : #'accessing - settings' }
SlmdLayoutView >> showDockedToolbar: anObject [

	self layoutSettingsView showDockedToolbar: anObject
]

{ #category : #toolbar }
SlmdLayoutView >> showDockedToolbarAdapt: aBoolean [

	self logTrace: aBoolean printString method: 'showDockedToolbarAdapt:'.

	self toolbarDockedDisplay: aBoolean.

]

{ #category : #'accessing - settings' }
SlmdLayoutView >> showFloatingToolbar [

	^ self layoutSettingsView showFloatingToolbar
]

{ #category : #'accessing - settings' }
SlmdLayoutView >> showFloatingToolbar: anObject [

	self layoutSettingsView showFloatingToolbar: anObject
]

{ #category : #toolbar }
SlmdLayoutView >> showFloatingToolbarAdapt: aBoolean [

	self logTrace: aBoolean printString method: 'showFloatingToolbarAdapt:'.

	self toolbarFloatingDisplay: aBoolean.

]

{ #category : #'accessing - settings' }
SlmdLayoutView >> showNavBar [

	^ self layoutSettingsView showNavBar
]

{ #category : #'accessing - settings' }
SlmdLayoutView >> showNavBar: anObject [

	self layoutSettingsView showNavBar: anObject
]

{ #category : #navbar }
SlmdLayoutView >> showNavBarAdapt: aBoolean [

	self logTrace: aBoolean printString method: 'showNavBarAdapt:'.

	self navBarDisplay: aBoolean.

]

{ #category : #'accessing - settings' }
SlmdLayoutView >> showNavMenuButton: anObject [

	self layoutSettingsView showNavMenuButton: anObject
]

{ #category : #body }
SlmdLayoutView >> showNavMenuButtonAdapt: aBoolean [

	self appBarLeadingButtonDisplay: aBoolean.

]

{ #category : #'accessing - settings' }
SlmdLayoutView >> showSidesheet [

	^ self layoutSettingsView showSidesheet
]

{ #category : #'accessing - settings' }
SlmdLayoutView >> showSidesheet: anObject [

	self layoutSettingsView showSidesheet: anObject
]

{ #category : #sidesheet }
SlmdLayoutView >> showSidesheetAdapt: aBoolean [

	self logTrace: aBoolean printString method: 'showSidesheetAdapt:'.

	self sidesheetDisplay: aBoolean.

]

{ #category : #sidesheet }
SlmdLayoutView >> sidesheetDisplay: aBoolean [

	self shadowElementId: 'smdSidesheet' show: aBoolean

]

{ #category : #initialization }
SlmdLayoutView >> themeUpdate [

	^ String streamContents: [:s |
		s nextPutAll: '
:root,
:host,
.sl-theme-light {
'.
		self colorThemeFrom: self colorThemeName asString on: s.
		"s nextPutAll: '--sl-focus-ring-style: none;'.
		s nextPutAll: '--sl-input-background-color: cyan;'.
		s nextPutAll: '--sl-input-background-color-hover red;'.
		s nextPutAll: '--sl-input-background-color-focus: yellow;'.
		s nextPutAll: '--sl-input-filled-background-color: cyan;'.
		s nextPutAll: '--sl-input-filled-background-color-hover red;'.
		s nextPutAll: '--sl-input-filled-background-color-focus: yellow;'."
		s nextPutAll: '
}
' ]
]

{ #category : #toolbar }
SlmdLayoutView >> toolbarDockedDisplay: aBoolean [

	self shadowElementId: 'smdDockedToolbar' show: aBoolean

]

{ #category : #toolbar }
SlmdLayoutView >> toolbarFloatingDisplay: aBoolean [

	self shadowElementId: 'smdFloatingToolbar' show: aBoolean

]

{ #category : #initialization }
SlmdLayoutView >> updateGlobalStyle [

	self logTrace: 'colorThemeName = ', self colorThemeName printString method: 'updateGlobalStyle'.
	CpHtmlElement documentAddStyle: self themeUpdate.

]

{ #category : #'accessing - settings' }
SlmdLayoutView >> useAutoLayout [

	^ self layoutSettingsView useAutoLayout
]

{ #category : #'accessing - settings' }
SlmdLayoutView >> useAutoLayout: anObject [

	self layoutSettingsView useAutoLayout: anObject
]

{ #category : #'accessing - settings' }
SlmdLayoutView >> useModalNav [

	^ self layoutSettingsView useModalNav
]

{ #category : #'accessing - settings' }
SlmdLayoutView >> useModalNav: anObject [

	self layoutSettingsView useModalNav: anObject
]

{ #category : #navrail }
SlmdLayoutView >> useModalNavAdapt: aBoolean [

	self logTrace: aBoolean printString method: 'useModalNavAdapt:'.

	self navRegionDisplay: aBoolean not.
	self bodySplitPanelAdapt.

]

{ #category : #'accessing - settings' }
SlmdLayoutView >> useTwoPaneBody [

	^ self layoutSettingsView useTwoPaneBody
]

{ #category : #'accessing - settings' }
SlmdLayoutView >> useTwoPaneBody: anObject [

	self layoutSettingsView useTwoPaneBody: anObject
]

{ #category : #body }
SlmdLayoutView >> useTwoPaneBodyAdapt: anObject [
	| component |

	self logTrace: anObject printString method: 'useTwoPaneBodyAdapt:'.

	component := SlmdPaneLayoutView first.
	component ifNotNil: [
		anObject
			ifTrue: [ component useTwoPaneLayout ]
			ifFalse: [ component useOnePaneLayout ] ].

]
