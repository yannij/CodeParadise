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
	| component |

	component := SlmdPaneLayoutView first.
	component ifNotNil: [
		component appBarDisplay: anObject ].

]

{ #category : #body }
SlmdLayoutView >> appBarLeadingButtonDisplay: anObject [
	| components |

	components := SlmdAppBarView all.
	components ifEmpty: [ self logError: 'appBarMenuDisplay: - No App bar found' ].
	components do: [ :each |
		each appBarLeadingButtonDisplay: anObject ].

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
SlmdLayoutView >> colorThemeFrom: base [
	|  |

	^ String streamContents: [:s |
		s nextPutAll: '
:root,
:host,
.sl-theme-light {
'.
		#('50' '100' '200' '300' '400' '500' '600' '700' '800' '900' '950') do: [ :each |
			s
				nextPutAll: '--sl-color-primary-';
				nextPutAll: each;
				nextPutAll: ': var(--sl-color-', base, '-';
				nextPutAll: each;
				nextPutAll: ');';
				yourself ].
		s nextPutAll: '
}
' ]
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

	"self layoutType: (props at: #layoutType ifAbsent: [])."
	self navRailExpandedAdapt: (props at: #navRailExpanded ifAbsent: [ false ]).
	self useModalNavAdapt: (props at: #useModalNav ifAbsent: [ false ]).
	self useTwoPaneBodyAdapt: (props at: #useTwoPaneBody ifAbsent: [ false ]).
	self sidesheetDisplay: (props at: #showSidesheet ifAbsent: [ false ]).
	self appBarDisplay: (props at: #showAppBar ifAbsent: [ false ]).
	self showNavBarAdapt: (props at: #showNavBar ifAbsent: [ false ]).
	self showDockedToolbarAdapt: (props at: #showDockedToolbar ifAbsent: [ false ]).
	self showFloatingToolbarAdapt: (props at: #showFloatingToolbar ifAbsent: [ false ]).
	self adjustBodyHeight.

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

	self logTrace: aLayoutType printString method: 'layoutTypeAdapt:'.

	aLayoutType = self class layoutTypeCompact ifTrue: [
		self layoutTypeBeCompact ].
	aLayoutType = self class layoutTypeMedium ifTrue: [
		self layoutTypeBeMedium ].
	aLayoutType = self class layoutTypeExpanded ifTrue: [
		self layoutTypeBeExpanded ].
	aLayoutType = self class layoutTypeLarge ifTrue: [
		 self layoutTypeBeLarge ].
	aLayoutType = self class layoutTypeExtraLarge ifTrue: [
		self layoutTypeBeExtraLarge ].

	self layoutSettingsView layoutUpdate.

]

{ #category : #layout }
SlmdLayoutView >> layoutTypeBeCompact [

	self
		navRailExpandedAdapt: false;
		showDockedToolbarAdapt: false;
		showFloatingToolbarAdapt: false;
		showSidesheetAdapt: false;
		useTwoPaneBodyAdapt: false;
		showNavBarAdapt: true;
		showNavMenuButtonAdapt: false;
		useModalNavAdapt: true.

	self
		layoutType: self class layoutTypeCompact;
		navRailExpanded: false;
		showDockedToolbar: false;
		showFloatingToolbar: false;
		showSidesheet: false;
		useTwoPaneBody: false;
		showAppBar: true;
		showNavBar: true;
		showNavMenuButton: false;
		useModalNav: true.

]

{ #category : #layout }
SlmdLayoutView >> layoutTypeBeExpanded [

	self
		navRailExpandedAdapt: false;
		showDockedToolbarAdapt: false;
		showFloatingToolbarAdapt: false;
		showSidesheetAdapt: false;
		useTwoPaneBodyAdapt: true;
		showNavBarAdapt: false;
		showNavMenuButtonAdapt: true;
		useModalNavAdapt: true.

	self
		layoutType: self class layoutTypeExpanded;
		navRailExpanded: false;
		showDockedToolbar: false;
		showFloatingToolbar: false;
		showSidesheet: false;
		useTwoPaneBody: true;
		showAppBar: true;
		showNavBar: false;
		showNavMenuButton: true;
		useModalNav: true.

]

{ #category : #layout }
SlmdLayoutView >> layoutTypeBeExtraLarge [

	self
		navRailExpandedAdapt: true;
		showDockedToolbarAdapt: false;
		showFloatingToolbarAdapt: false;
		showSidesheetAdapt: true;
		useTwoPaneBodyAdapt: true;
		showNavBarAdapt: false;
		showNavMenuButtonAdapt: false;
		useModalNavAdapt: false.

	self
		layoutType: self class layoutTypeExtraLarge;
		navRailExpanded: true;
		showDockedToolbar: false;
		showFloatingToolbar: false;
		showSidesheet: true;
		useTwoPaneBody: true;
		showAppBar: true;
		showNavBar: false;
		useModalNav: false.

]

{ #category : #layout }
SlmdLayoutView >> layoutTypeBeLarge [

	self
		navRailExpandedAdapt: false;
		showDockedToolbarAdapt: false;
		showFloatingToolbarAdapt: false;
		showSidesheetAdapt: false;
		useTwoPaneBodyAdapt: true;
		showNavBarAdapt: false;
		showNavMenuButtonAdapt: false;
		useModalNavAdapt: false.

	self
		layoutType: self class layoutTypeLarge;
		navRailExpanded: false;
		showDockedToolbar: false;
		showFloatingToolbar: false;
		showSidesheet: false;
		useTwoPaneBody: true;
		showAppBar: true;
		showNavBar: false;
		useModalNav: false.

]

{ #category : #layout }
SlmdLayoutView >> layoutTypeBeMedium [

	self
		navRailExpandedAdapt: true;
		showDockedToolbarAdapt: false;
		showFloatingToolbarAdapt: false;
		showSidesheetAdapt: false;
		useTwoPaneBodyAdapt: true;
		showNavBarAdapt: true;
		showNavMenuButtonAdapt: false;
		useModalNavAdapt: true.

	self
		layoutType: self class layoutTypeMedium;
		navRailExpanded: true;
		showDockedToolbar: false;
		showFloatingToolbar: false;
		showSidesheet: false;
		useTwoPaneBody: true;
		showAppBar: true;
		showNavBar: true;
		useModalNav: true.

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

{ #category : #'accessing - settings' }
SlmdLayoutView >> showAppBar [

	^ self layoutSettingsView showAppBar
]

{ #category : #'accessing - settings' }
SlmdLayoutView >> showAppBar: anObject [

	self layoutSettingsView showAppBar: anObject
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

	self showDockedToolbar: aBoolean.
	self toolbarDockedDisplay: aBoolean.

	self adjustBodyHeight.
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

	self showFloatingToolbar: aBoolean.
	self toolbarFloatingDisplay: aBoolean.

	self adjustBodyHeight.

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

	self showNavBar: aBoolean.
	self navBarDisplay: aBoolean.

	self adjustBodyHeight.
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

	self showSidesheet: aBoolean.
	self sidesheetDisplay: aBoolean.

]

{ #category : #sidesheet }
SlmdLayoutView >> sidesheetDisplay: aBoolean [

	self shadowElementId: 'smdSidesheet' show: aBoolean

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
	CpHtmlElement documentAddStyle: (self colorThemeFrom: self colorThemeName asString).

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
