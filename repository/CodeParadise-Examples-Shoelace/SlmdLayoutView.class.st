Class {
	#name : #SlmdLayoutView,
	#superclass : #SlmdView,
	#instVars : [
		'debounceTransition',
		'layoutSettingsView',
		'layoutWidthCached'
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
    <footer id="smdToolbar">
      <slot name="toolbar"></slot>
    </footer>
  </div>
  <div id="smdModalDiv"></div>
</div>
'
]

{ #category : #events }
SlmdLayoutView >> adaptWithAspect: aspect value: anObject [

	self traceCr: aspect printString, ' -> ', anObject printString.

	self serverAnnounce: (CpActionRequested
		id: #adapt
		parameters: {
			#aspect -> aspect.
			#value -> anObject
		} asDictionary).
]

{ #category : #body }
SlmdLayoutView >> adjustBodyHeight [
	| bodyRegion bodyHeight |

	bodyRegion := self bodyRegionFind.
	bodyRegion ifNil: [ ^ self  ].

	bodyHeight := (self showNavBar or: [self showToolbar])
		ifTrue: [ 'calc(100vh - 64px)' ]
		ifFalse: [ '100vh' ].
	bodyRegion styleAt: 'height' put: bodyHeight.
	bodyRegion styleAt: 'max-height' put: bodyHeight.
]

{ #category : #events }
SlmdLayoutView >> appBarDisplay: anObject [
	| component |

	component := SlmdPaneLayoutView first.
	component ifNotNil: [
		component appBarDisplay: anObject ].

	self adaptWithAspect: #appBarDisplay value: anObject

]

{ #category : #events }
SlmdLayoutView >> appBarMenuDisplay: anObject [
	| components |

	components := SlmdAppBarView all.
	components do: [ :each |
		each appBarMenuDisplay: anObject ].

	self adaptWithAspect: #appBarMenuDisplay value: anObject

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

	self adaptWithAspect: #twoPaneSplitPosition value: w
]

{ #category : #'color theme' }
SlmdLayoutView >> colorThemeAdapt: aColorName [

	self traceCr: 'colorThemeAdapt: ', aColorName printString.
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

	"colorThemeName := self defaultColorThemeName."
	layoutWidthCached := 0.

	"#layoutSetUp will set the value later. DO NOT set it here."
	"layoutType := nil."

]

{ #category : #'accessing - settings' }
SlmdLayoutView >> isExpanded [

	^ self layoutSettingsView isExpanded
]

{ #category : #'accessing - settings' }
SlmdLayoutView >> isExpanded: anObject [

	self layoutSettingsView isExpanded: anObject
]

{ #category : #layout }
SlmdLayoutView >> layoutAdaptToWidth [

	layoutWidthCached < 600 ifTrue: [ ^ self layoutTypeChangeAutoResize: #compact ].
	layoutWidthCached < 840 ifTrue: [ ^ self layoutTypeChangeAutoResize: #medium ].
	layoutWidthCached < 1200 ifTrue: [ ^ self layoutTypeChangeAutoResize: #expanded ].
	layoutWidthCached < 1600 ifTrue: [ ^ self layoutTypeChangeAutoResize: #large ].
	self layoutTypeChangeAutoResize: #'extra-large'.

]

{ #category : #layout }
SlmdLayoutView >> layoutInitialSetUp: props [
	"Invoked by presenter's viewCreated"

	self traceCr: ('layoutInitialSetUp: ', props printString).
	self colorThemeAdapt: (props at: #colorThemeName ifAbsent: []).
	self fontFamilyAdapt: (props at: #fontFamily ifAbsent: []).
	self isExpanded: (props at: #isExpanded ifAbsent: [ false ]).
	self layoutTypeAdapt: (props at: #layoutType ifAbsent: []).
	self toolbarOff.
	self resizeSetUp.
	self adjustBodyHeight.

	(props at: #useAutoLayout ifAbsent: [ true ]) ifTrue: [
		self layoutAdaptToWidth ].

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

	"self layoutType = aLayoutType ifTrue: [
		^ self ]."

	aLayoutType = #compact ifTrue: [
		self navRegionModalOn; navRailExpandedOff; navBarOn; sidesheetOff; useTwoPanesChangeAutoResize: false ].
	aLayoutType = #medium ifTrue: [
		self navRegionModalOn; navRailExpandedOn; navBarOn; sidesheetOff; useTwoPanesChangeAutoResize: true  ].
	aLayoutType = #expanded ifTrue: [
		self navRegionModalOff; navRailExpandedOff; navBarOff; sidesheetOff; useTwoPanesChangeAutoResize: true  ].
	aLayoutType = #large ifTrue: [
		 self navRegionModalOff; navRailExpandedOff; navBarOff; sidesheetOff; useTwoPanesChangeAutoResize: true  ].
	aLayoutType = #'extra-large' ifTrue: [
		self navRegionModalOff; navRailExpandedOn; navBarOff; sidesheetOn; useTwoPanesChangeAutoResize: true  ].

	self bodySplitPanelAdapt.

]

{ #category : #layout }
SlmdLayoutView >> layoutTypeChangeAutoResize: aLayoutType [

	self layoutTypeAdapt: aLayoutType
]

{ #category : #layout }
SlmdLayoutView >> layoutTypeChangeManual: aLayoutType [

	self useAutoLayout: false.
	self layoutTypeAdapt: aLayoutType.

]

{ #category : #accessing }
SlmdLayoutView >> layoutWidthCached [

	^ layoutWidthCached
]

{ #category : #accessing }
SlmdLayoutView >> layoutWidthCached: anObject [

	layoutWidthCached := anObject
]

{ #category : #navbar }
SlmdLayoutView >> navBarDisplay: aBoolean [

	self shadowElementId: 'smdNavBar' show: aBoolean

]

{ #category : #navbar }
SlmdLayoutView >> navBarOff [

	self showNavBar: false.
	self navBarDisplay: false.
	self adjustBodyHeight.

]

{ #category : #navbar }
SlmdLayoutView >> navBarOn [

	self showNavBar: true.
	self navBarDisplay: true.
	self adjustBodyHeight.

]

{ #category : #navrail }
SlmdLayoutView >> navRailExpandedAdapt: aBoolean [
	| modalElement navComponent |

	self traceCr: '**** navRailExpandedAdapt: : ', aBoolean printString.

	"Set type in nav view"
	navComponent := SlmdNavRailView first.
	navComponent ifNotNil: [ navComponent isExpanded: aBoolean ].

	self navRegionFind
		styleAt: 'flex'
		put: '0 0 ', self navRailWidth printString, 'px'.

	modalElement := self modalNavElementOrNil.
	modalElement ifNotNil: [
		modalElement customPropertyAt: 'size' put: self navRailWidth printString, 'px'.
		SlmdNavRailView first navSetUp ].

	"Set type in nav model"
	"self adaptWithAspect: #isExpanded value: aBoolean."

	self bodySplitPanelAdapt.

]

{ #category : #navrail }
SlmdLayoutView >> navRailExpandedOff [

	self navRailExpandedAdapt: false.

]

{ #category : #navrail }
SlmdLayoutView >> navRailExpandedOn [

	self navRailExpandedAdapt: true.

]

{ #category : #events }
SlmdLayoutView >> navRailModalSet: anObject [

	"Set type in nav view"
	SlmdNavRailView first isModal: anObject.

	"Adapt layout"
	self navRegionModalAdapt: anObject.

]

{ #category : #navrail }
SlmdLayoutView >> navRailWidth [

	^ self isExpanded ifTrue: [ 220 ] ifFalse: [ 96 ]
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

{ #category : #navrail }
SlmdLayoutView >> navRegionModalAdapt: isOn [

	isOn
		ifTrue: [
			self navRegionDisplay: false.
			self appBarMenuDisplay: true ]
		ifFalse: [
			self navRegionDisplay: true.
			self appBarMenuDisplay: false ].

	self bodySplitPanelAdapt.

]

{ #category : #navrail }
SlmdLayoutView >> navRegionModalOff [

	self useModalNav: false.
	self navRegionModalAdapt: false.

]

{ #category : #navrail }
SlmdLayoutView >> navRegionModalOn [

	self useModalNav: true.
	self navRegionModalAdapt: true.

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

{ #category : #events }
SlmdLayoutView >> paneLayoutAdapt: anObject [
	| component |

	component := SlmdPaneLayoutView first.
	component ifNotNil: [
		anObject
			ifTrue: [ component useTwoPaneLayout ]
			ifFalse: [ component useOnePaneLayout ] ].

	self adaptWithAspect: #paneLayout value: anObject

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
SlmdLayoutView >> showNavBar [

	^ self layoutSettingsView showNavBar
]

{ #category : #'accessing - settings' }
SlmdLayoutView >> showNavBar: anObject [

	self layoutSettingsView showNavBar: anObject
]

{ #category : #'accessing - settings' }
SlmdLayoutView >> showSidesheet [

	^ self layoutSettingsView showSidesheet
]

{ #category : #'accessing - settings' }
SlmdLayoutView >> showSidesheet: anObject [

	self layoutSettingsView showSidesheet: anObject
]

{ #category : #'accessing - settings' }
SlmdLayoutView >> showToolbar [

	^ self layoutSettingsView showToolbar
]

{ #category : #'accessing - settings' }
SlmdLayoutView >> showToolbar: anObject [

	self layoutSettingsView showToolbar: anObject
]

{ #category : #sidesheet }
SlmdLayoutView >> sidesheetDisplay: aBoolean [

	self shadowElementId: 'smdSidesheet' show: aBoolean

]

{ #category : #sidesheet }
SlmdLayoutView >> sidesheetOff [

	self showSidesheet: false.
	self sidesheetDisplay: false.

]

{ #category : #sidesheet }
SlmdLayoutView >> sidesheetOn [

	self showSidesheet: true.
	self sidesheetDisplay: true.

]

{ #category : #toolbar }
SlmdLayoutView >> toolbarDisplay: aBoolean [

	self shadowElementId: 'smdToolbar' show: aBoolean

]

{ #category : #toolbar }
SlmdLayoutView >> toolbarOff [

	self showToolbar: false.
	self toolbarDisplay: false.
	self adjustBodyHeight.

]

{ #category : #toolbar }
SlmdLayoutView >> toolbarOn [

	self showToolbar: true.
	self toolbarDisplay: true.
	self adjustBodyHeight.

]

{ #category : #initialization }
SlmdLayoutView >> updateGlobalStyle [

	self traceCr: 'updateGlobalStyle... colorThemeName = ', self colorThemeName printString.
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

{ #category : #'accessing - settings' }
SlmdLayoutView >> useTwoPaneBody [

	^ self layoutSettingsView useTwoPaneBody
]

{ #category : #'accessing - settings' }
SlmdLayoutView >> useTwoPaneBody: anObject [

	self layoutSettingsView useTwoPaneBody: anObject
]

{ #category : #body }
SlmdLayoutView >> useTwoPanesChangeAutoResize: aBoolean [

	self useTwoPaneBody = aBoolean ifTrue: [
		^ self ].

	self useTwoPaneBody: aBoolean.
	self paneLayoutAdapt: aBoolean.

]
