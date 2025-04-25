Class {
	#name : #SlmdLayoutView,
	#superclass : #SlmdView,
	#instVars : [
		'width',
		'height',
		'currentLayout',
		'iconButtons',
		'fab',
		'colorThemeName',
		'navActions',
		'navItems',
		'debounceTransition'
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

	^ self globalStyleNav
]

{ #category : #'web resources' }
SlmdLayoutView class >> globalStyleNav [

	<webResource: #css>

	^ '
.smd-navRegion {
  flex: 0 0 80px;
  height: 100%;
  padding: 0;
  margin: 0;
}

.smd-nav-font {
  line-height: var(--sl-line-height-normal);
  font-size: var(--sl-font-size-medium);
  font-weight: var(--sl-font-weight-bold);
}

.smd-navrail {
  height: 100%;
  overflow-y: auto;
  padding: 0;
  margin: 0;
  background: var(--sl-color-primary-100);
}

.smd-navrail-item {
  display: flex;
  flex-flow: column;
  height: 56px;
  width: 80px;
  padding-top: 12px;
}

.smd-navrail-icon {
  padding: 0 16px;
  font-size: 24px;
}

.smd-navrail-labelText {
  padding: 0;
  line-height: 16pt;
  font-size: var(--sl-font-size-x-small);
  text-align: center;
  overflow-x: clip;
}

.smd-navdrawer {
  height: 100%;
  padding: 0 4px 0 12px;
  margin: 0;
  background: var(--sl-color-primary-100);
  flow-direction: row;
}

.smd-nav-drawer::part(panel) {
  background: var(--sl-color-primary-100);
}

.smd-navdrawer-headline {
  padding: 12px 4px 12px 12px;
}

.smd-navdrawer-item {
  display: flex;
  border-radius: 28px;
  height: 56px;
  background: var(--sl-color-primary-100);
}

.smd-navdrawer-icon {
  padding-top: 8px;
  padding-left: 4px;
  font-size: 24px;
}

.smd-navdrawer-labelText {
  padding-top: 12px;
  padding-left: 12px;
  width: 236px;
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
]

{ #category : #'web resources' }
SlmdLayoutView class >> template [

	<webResource: #html>

	^ '
<div id="container" class="smd-layout">
  <div style="display: flex; flex-direction: column">
    <div style="height: 100%; flex: 1; display: flex; flex-direction: row">
      <div id="smdNavRegion" class="smd-navRegion">
        <slot name="navRegion"></slot>
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
    <footer id="smdBottomAppBar">
      <slot name="bottomAppBar"></slot>
    </footer>
  </div>
  <slot name="navModalPane"></slot>
  <slot name="settings"></slot>
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

{ #category : #utilities }
SlmdLayoutView >> addAttributeContainerStyle: element [

	^ element styleAt: 'padding-bottom' put: '12px'; yourself
]

{ #category : #nav }
SlmdLayoutView >> addNavActionId: id key: key value: value [
	| item |

	(navActions includesKey: id "asSymbol") ifFalse: [
		navActions at: id "asSymbol" put: Dictionary new ].
	item := navActions at: id "asSymbol".
	item at: key "asSymbol" put: value
]

{ #category : #nav }
SlmdLayoutView >> addNavItem: aNavActionId [

	self navItems add: aNavActionId asSymbol
]

{ #category : #body }
SlmdLayoutView >> adjustBodyHeight [
	| bodyRegion bodyHeight |

	bodyRegion := self bodyRegionFind.
	bodyRegion ifNil: [ ^ self  ].

	bodyHeight := self showBottomAppBar ifTrue: [ 'calc(100vh - 72px)' ] ifFalse: [ '100vh' ].
	bodyRegion styleAt: 'height' put: bodyHeight.
	bodyRegion styleAt: 'max-height' put: bodyHeight.
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

{ #category : #bottomAppBar }
SlmdLayoutView >> bottomAppBarDisplay: aBoolean [

	self shadowElementId: 'smdBottomAppBar' show: aBoolean

]

{ #category : #bottomAppBar }
SlmdLayoutView >> bottomAppBarOff [

	self showBottomAppBar: false.
	self bottomAppBarDisplay: false.
	self adjustBodyHeight.

]

{ #category : #bottomAppBar }
SlmdLayoutView >> bottomAppBarOn [

	self showBottomAppBar: true.
	self bottomAppBarDisplay: true.
	self adjustBodyHeight.

]

{ #category : #'nav - drawer' }
SlmdLayoutView >> buildNavdrawerItem: aNavAction [
	| iconName arg1 |

	iconName := aNavAction at: #iconName.
	arg1 := aNavAction at: #arg1.

	^ #div asHtmlTag
		addClass: 'smd-navdrawer-item';
		addClass: 'smd-nav-font';
		when: CpClickEvent basicPrimary do: [ self navigateTo: arg1 ] for: self;
		appendChild: ((SlIconButton named: iconName) addClass: 'smd-navdrawer-icon'; yourself);
		appendChild: (#div asHtmlTag
			addClass: 'smd-navdrawer-labelText';
			textContent: (aNavAction at: #iconLabel);
			yourself);
		yourself
]

{ #category : #'nav - rail' }
SlmdLayoutView >> buildNavrailItem: aNavAction [
	| iconName arg1 |

	iconName := aNavAction at: #iconName.
	arg1 := aNavAction at: #arg1.

	^ #div asHtmlTag
		addClass: 'smd-navrail-item';
		when: CpClickEvent basicPrimary do: [ self navigateTo: arg1 ] for: self;
		appendChild: (
			(SlIconButton named: iconName)
				addClass: 'smd-navrail-icon';
				yourself);
		appendChild: (
			#div asHtmlTag
				addClass: 'smd-navrail-labelText';
				textContent: (aNavAction at: #iconLabel);
				yourself);
		yourself
]

{ #category : #'color theme' }
SlmdLayoutView >> colorThemeAdapt: aColorName [

	self colorThemeName: aColorName.
	self updateGlobalStyle.

]

{ #category : #settings }
SlmdLayoutView >> colorThemeBuildChooser [
	| chooser |

	chooser := SlSelect new
		id: 'smdColorThemeChooser';
		labelText: 'Use color theme:';
		propertyAt: 'value' put: self defaultColorThemeName asString;
		yourself.

	chooser when: SlChangeEvent do: [ self colorThemeAdapt: chooser value ] for: self.

	#(gray red orange amber yellow lime green emerald teal cyan sky blue indigo violet purple fuchsia pink rose)
		do: [ :each |
			chooser appendChild: (SlOption new value: each; textContent: each capitalized; yourself) ].

	^ chooser
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

{ #category : #accessing }
SlmdLayoutView >> colorThemeName [

	^ colorThemeName
]

{ #category : #accessing }
SlmdLayoutView >> colorThemeName: anObject [

	colorThemeName := anObject
]

{ #category : #accessing }
SlmdLayoutView >> currentLayout [

	^ currentLayout
]

{ #category : #accessing }
SlmdLayoutView >> currentLayout: anObject [

	currentLayout := anObject
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

{ #category : #'color theme' }
SlmdLayoutView >> defaultColorThemeName [

	^ #sky
]

{ #category : #typography }
SlmdLayoutView >> defaultFontFamily [

	^ nil
]

{ #category : #utilities }
SlmdLayoutView >> elementId: id propertyAt: key ifNotFound: defaultValue [
	| element |

	element := CpHtmlElement documentBody firstDescendantMatching: id.
	element ifNil: [ ^ defaultValue ].
	^ element propertyAt: key
]

{ #category : #utilities }
SlmdLayoutView >> elementId: id propertyAt: key put: value [
	| element |

	element := CpHtmlElement documentBody firstDescendantMatching: id.
	element ifNotNil: [
		element propertyAt: key put: value ]
]

{ #category : #accessing }
SlmdLayoutView >> fab [

	^ fab
]

{ #category : #accessing }
SlmdLayoutView >> fab: anObject [

	fab := anObject
]

{ #category : #typography }
SlmdLayoutView >> fontFamilyAdapt: aFontFamily [
	| element |

	element := self bodyFind.
	element ifNil: [ ^ self ].

	element styleAt: 'font-family' put: aFontFamily

]

{ #category : #settings }
SlmdLayoutView >> fontFamilyChooserBuild [
	| chooser |

	chooser := SlSelect new
		id: 'smdFontFamilyChooser';
		labelText: 'Use font family:';
		propertyAt: 'value' put: self defaultFontFamily asString;
		yourself.

	chooser when: SlChangeEvent do: [ self fontFamilyAdapt: chooser value ] for: self.

	{
nil -> 'Default'.
#'var(--sl-font-sans)' -> 'Sans'.
#'var(--sl-font-serif)' -> 'Serif'.
#'var(--sl-font-mono)' -> 'Mono'
}
		do: [ :each |
			chooser appendChild: (SlOption new value: each key; textContent: each value capitalized; yourself) ].

	^ chooser
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

	width = newWidth ifTrue: [
		^ self ].

	width := newWidth.
	self bodySplitPanelAdapt.
	self useAutoLayout not ifTrue: [
		^ self ].

	self layoutAdaptToWidth
]

{ #category : #accessing }
SlmdLayoutView >> height [

	^ height
]

{ #category : #accessing }
SlmdLayoutView >> height: anObject [

	height := anObject
]

{ #category : #accessing }
SlmdLayoutView >> iconButtons [

	^ iconButtons
]

{ #category : #accessing }
SlmdLayoutView >> iconButtons: anObject [

	iconButtons := anObject
]

{ #category : #initialization }
SlmdLayoutView >> initialize [

	super initialize.

	colorThemeName := self defaultColorThemeName.
	width := 0.

	"#layoutSetUp will set the value later. DO NOT set it here."
	"layoutType := nil."

	navActions := Dictionary new.
	navItems := OrderedCollection new.

]

{ #category : #layout }
SlmdLayoutView >> layoutAdaptToWidth [

	width < 600 ifTrue: [ ^ self layoutTypeChangeAutoResize: #compact ].
	width < 840 ifTrue: [ ^ self layoutTypeChangeAutoResize: #medium ].
	width < 1200 ifTrue: [ ^ self layoutTypeChangeAutoResize: #expanded ].
	width < 1600 ifTrue: [ ^ self layoutTypeChangeAutoResize: #large ].
	self layoutTypeChangeAutoResize: #'extra-large'.

]

{ #category : #layout }
SlmdLayoutView >> layoutSetUp [
	"Invoked by presenter's viewInitialize"

	self settingsSetUp.
	self navModalPaneSetUp.
	self navSetUp.
	"self bodySetUp."
	self sidesheetSetUp.
	"self bottomAppBarSetUp."

	self colorThemeAdapt: self defaultColorThemeName.
	self fontFamilyAdapt: self defaultFontFamily.
	self layoutTypeAdapt: self layoutTypeDefault.
	self resizeSetUp.

]

{ #category : #settings }
SlmdLayoutView >> layoutType [

	^ self elementId: '#smdLayoutTypeChooser' propertyAt: #value ifNotFound: self layoutTypeDefault
]

{ #category : #settings }
SlmdLayoutView >> layoutType: aLayoutType [

	self elementId: '#smdLayoutTypeChooser' propertyAt: #value put: aLayoutType
]

{ #category : #layout }
SlmdLayoutView >> layoutTypeAdapt: aLayoutType [

	self currentLayout = aLayoutType ifTrue: [
		^ self ].

	self currentLayout: aLayoutType.
	aLayoutType = #compact ifTrue: [
		self navRegionModalOn; navTypeUseRail; bottomAppBarOn; sidesheetOff; useTwoPanesChangeAutoResize: false ].
	aLayoutType = #medium ifTrue: [
		self navRegionModalOn; navTypeUseDrawer; bottomAppBarOn; sidesheetOff; useTwoPanesChangeAutoResize: true  ].
	aLayoutType = #expanded ifTrue: [
		self navRegionModalOff; navTypeUseRail; bottomAppBarOff; sidesheetOff; useTwoPanesChangeAutoResize: true  ].
	aLayoutType = #large ifTrue: [
		 self navRegionModalOff; navTypeUseRail; bottomAppBarOff; sidesheetOff; useTwoPanesChangeAutoResize: true  ].
	aLayoutType = #'extra-large' ifTrue: [
		self navRegionModalOff; navTypeUseDrawer; bottomAppBarOff; sidesheetOn; useTwoPanesChangeAutoResize: true  ].

	self bodySplitPanelAdapt.

]

{ #category : #settings }
SlmdLayoutView >> layoutTypeBuildChooser [
	| radioGroup |

	radioGroup := SlRadioGroup new
		id: 'smdLayoutTypeChooser';
		propertyAt: 'label' put: 'Use layout style:';
		propertyAt: 'value' put: self layoutTypeDefault;
		yourself.

	radioGroup when: SlChangeEvent do: [ self layoutTypeChangeManual: radioGroup value ] for: self.

	radioGroup appendChild: (SlRadio new value: #compact; textContent: 'Compact'; yourself).
	radioGroup appendChild: (SlRadio new value: #medium; textContent: 'Medium'; yourself).
	radioGroup appendChild: (SlRadio new value: #expanded; textContent: 'Expanded'; yourself).
	radioGroup appendChild: (SlRadio new value: #large; textContent: 'Large'; yourself).
	radioGroup appendChild: (SlRadio new value: #'extra-large'; textContent: 'Extra-large'; yourself).

	^ radioGroup
]

{ #category : #layout }
SlmdLayoutView >> layoutTypeChangeAutoResize: aLayoutType [

	aLayoutType = self layoutType ifTrue: [
		^ self ].

	self layoutType: aLayoutType.
	self layoutTypeAdapt: aLayoutType
]

{ #category : #layout }
SlmdLayoutView >> layoutTypeChangeManual: aLayoutType [

	self layoutTypeAdapt: aLayoutType.
	self useAutoLayout: false.
	self currentLayout: nil.

]

{ #category : #accessing }
SlmdLayoutView >> layoutTypeDefault [

	^ #expanded
]

{ #category : #accessing }
SlmdLayoutView >> navActions [

	^ navActions
]

{ #category : #accessing }
SlmdLayoutView >> navActions: anObject [

	navActions := anObject
]

{ #category : #nav }
SlmdLayoutView >> navContentBuild [

	self navTypeIsDrawer ifTrue: [
		^ self navdrawerBuild ].

	^ self navrailBuild
]

{ #category : #accessing }
SlmdLayoutView >> navItems [

	^ navItems
]

{ #category : #accessing }
SlmdLayoutView >> navItems: anObject [

	navItems := anObject
]

{ #category : #nav }
SlmdLayoutView >> navModalPaneBuild [
	| drawer |

	drawer := SlDrawer new
		id: 'smdNavModalPane';
		addClass: 'smd-nav-drawer';
		placement: 'start';
		beNoHeader;
		customPropertyAt: 'size' put: self navTypeWidth printString;
		customPropertyAt: 'body-spacing' put: '0';
		customPropertyAt: 'header-spacing' put: '0';
		customPropertyAt: 'footer-spacing' put: '0';
		appendChild: ((CpHtmlElement newWithTag: #div)
			id: 'smdNavModalPaneContent';
			"contentText: 'Lorem ipsum...';"
			yourself);
		yourself.
	
	"drawer footer: (
		(SlButton label: 'Close')
			when: CpClickEvent basicPrimary send: #hide to: drawer;
			yourself)."

	^ drawer
]

{ #category : #nav }
SlmdLayoutView >> navModalPaneContentFind [

	^ CpHtmlElement documentBody firstDescendantMatching: '#smdNavModalPaneContent'
]

{ #category : #nav }
SlmdLayoutView >> navModalPaneSetUp [

	self replaceAllChildrenWith: self navModalPaneBuild atSlotNamed: #'navModalPane'

]

{ #category : #nav }
SlmdLayoutView >> navRegionDisplay: aBoolean [
	| element |

	element := self navRegionFind.
	element ifNotNil: [
		aBoolean
			ifTrue: [ element removeStyleAt: 'display' ]
			ifFalse: [ element styleAt: 'display' put: 'none' ] ].

]

{ #category : #nav }
SlmdLayoutView >> navRegionFind [

	"^ CpHtmlElement documentBody firstDescendantMatching: '#smdNavRegion'"
	^ self shadowedElementWithId: 'smdNavRegion'
]

{ #category : #nav }
SlmdLayoutView >> navRegionModalAdapt: isOn [

	isOn
		ifTrue: [
			self navRegionDisplay: false.
			self topAppBarMenuDisplay: true ]
		ifFalse: [
			self navRegionDisplay: true.
			self topAppBarMenuDisplay: false ].

	self navSetUp.
	self bodySplitPanelAdapt.

]

{ #category : #nav }
SlmdLayoutView >> navRegionModalOff [

	self useModalNav: false.
	self navRegionModalAdapt: false.

]

{ #category : #nav }
SlmdLayoutView >> navRegionModalOn [

	self useModalNav: true.
	self navRegionModalAdapt: true.

]

{ #category : #nav }
SlmdLayoutView >> navSetUp [

	self useModalNav
		ifTrue: [ | el |
			self removeChildrenAtSlotNamed: 'navRegion'.
			el := self navModalPaneContentFind.
			el ifNotNil: [
				el replaceAllChildrenWith: self navContentBuild ]]
		ifFalse: [ 
			self
				replaceAllChildrenWith: self navContentBuild
				atSlotNamed: 'navRegion' ]
]

{ #category : #settings }
SlmdLayoutView >> navType [

	^ self elementId: '#smdNavTypeChooser' propertyAt: #value ifNotFound: self navTypeDefault
]

{ #category : #settings }
SlmdLayoutView >> navType: aNavType [

	^ self elementId: '#smdNavTypeChooser' propertyAt: #value put: aNavType
]

{ #category : #nav }
SlmdLayoutView >> navTypeAdapt: aNavType [

	self navRegionFind
		styleAt: 'flex'
		put: '0 0 ', self navTypeWidth printString, 'px'.

	self navModalPaneFind
		customPropertyAt: 'size'
		put: self navTypeWidth printString.

	self navSetUp.
	self bodySplitPanelAdapt.

]

{ #category : #nav }
SlmdLayoutView >> navTypeBeBar [

	self navType: #bar
]

{ #category : #nav }
SlmdLayoutView >> navTypeBeDrawer [

	self navType: #drawer
]

{ #category : #nav }
SlmdLayoutView >> navTypeBeRail [

	self navType: #rail
]

{ #category : #settings }
SlmdLayoutView >> navTypeBuildChooser [
	| radioGroup |

	radioGroup := SlRadioGroup new
		id: 'smdNavTypeChooser';
		propertyAt: 'label' put: 'Use navigation type:';
		propertyAt: 'value' put: self navTypeDefault;
		yourself.

	radioGroup when: SlChangeEvent do: [ self navTypeAdapt: radioGroup value ] for: self.

	radioGroup appendChild: (SlRadio new value: #rail; textContent: 'Rail'; yourself).
	radioGroup appendChild: (SlRadio new value: #drawer; textContent: 'Drawer'; yourself).
	radioGroup appendChild: (SlRadio new value: #bar; textContent: 'Bar'; propertyAt: #disabled put: true; yourself).

	^ radioGroup
]

{ #category : #nav }
SlmdLayoutView >> navTypeDefault [

	^ #rail
]

{ #category : #nav }
SlmdLayoutView >> navTypeIsBar [

	^ self navType = #bar
]

{ #category : #nav }
SlmdLayoutView >> navTypeIsDrawer [

	^ self navType = #drawer
]

{ #category : #nav }
SlmdLayoutView >> navTypeIsRail [

	^ self navType = #rail
]

{ #category : #nav }
SlmdLayoutView >> navTypeUseDrawer [

	self navTypeBeDrawer.
	self navTypeAdapt: #drawer.

]

{ #category : #nav }
SlmdLayoutView >> navTypeUseRail [

	self navTypeBeRail.
	self navTypeAdapt: #rail.

]

{ #category : #nav }
SlmdLayoutView >> navTypeWidth [

	self navTypeIsRail ifTrue: [ ^ 80 ].
	self navTypeIsDrawer ifTrue: [ ^ 360 ].
	self navTypeIsBar ifTrue: [ ^ 0 ].
	^ 80
]

{ #category : #'nav - drawer' }
SlmdLayoutView >> navdrawerBuild [
	| element drawer |

	drawer := self navModalPaneFind.

	element := #div asHtmlTag
		addClass: 'smd-navdrawer';
		appendChild: (#div asHtmlTag
			addClass: 'smd-navdrawer-headline';
			addClass: 'smd-nav-font';
			textContent: 'Headline';
			yourself);
		yourself.
	navItems ifNotNil: [
		navItems do: [ :eachItem | | navItem |
			navItem := self buildNavdrawerItem: (navActions at: eachItem).
			navItem when: CpClickEvent basicPrimary send: #hide to: drawer.
			element appendChild: navItem ] ].

	^ #nav asHtmlTag
		styleAt: 'height' put: '100%';
		"styleAt: 'overflow-y' put: 'auto';"
		appendChild: element;
		yourself
]

{ #category : #nav }
SlmdLayoutView >> navigateTo: aString [

	self serverAnnounce: (CpActionRequested id: #navigate parameters: { #to -> aString } asDictionary).

]

{ #category : #'nav - rail' }
SlmdLayoutView >> navrailBuild [
	| element drawer |

	drawer := self navModalPaneFind.

	element := #div asHtmlTag addClass: 'smd-navrail'; yourself.
	navItems ifNotNil: [
		navItems do: [ :eachItem | | navItem |
			navItem := self buildNavrailItem: (navActions at: eachItem asSymbol).
			navItem when: CpClickEvent basicPrimary send: #hide to: drawer.
			element appendChild: navItem ] ].
	"element appendChild: (
		(SlIconButton named: 'gear')
			when: CpClickEvent basicPrimary send: #settingsOpen to: self;
			yourself)."

	^ #nav asHtmlTag
		styleAt: 'height' put: '100%';
		"styleAt: 'overflow-y' put: 'auto';"
		appendChild: element;
		yourself
]

{ #category : #utilities }
SlmdLayoutView >> newToggleId: id label: label do: aBlock [
	| toggle |

	toggle := SlSwitch new
		id: id;
		label: label;
		checked: true;
		when: SlChangeEvent do: aBlock for: self;
		yourself.

	^ (CpHtmlElement newWithTag: #div) appendChild: toggle; yourself.

]

{ #category : #body }
SlmdLayoutView >> pane1WidthCompute [
	| w |

	w := ((self width "- self bodySplitPanelDividerWidth") / 2) asInteger.
	self useModalNav ifFalse: [  w := w - self navTypeWidth ].
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

{ #category : #settings }
SlmdLayoutView >> settingsPaneBuild [
	| element |

	element := #div asHtmlTag
		addClass: 'smd-settings-pane';
		appendChild: (self addAttributeContainerStyle: self useAutoLayoutBuildToggle);
		appendChild: (self addAttributeContainerStyle: self layoutTypeBuildChooser);
		appendChild: (self addAttributeContainerStyle: self navTypeBuildChooser);
		appendChild: (self addAttributeContainerStyle: self useModalNavBuildToggle);
		appendChild: (self addAttributeContainerStyle: self useTwoPaneBodyBuildToggle);
		appendChild: (self addAttributeContainerStyle: self showTopAppBarBuildToggle);
		appendChild: (self addAttributeContainerStyle: self showBottomAppBarBuildToggle);
		appendChild: (self addAttributeContainerStyle: self showSidesheetBuildToggle);
		appendChild: (self addAttributeContainerStyle: self colorThemeBuildChooser);
		appendChild: (self addAttributeContainerStyle: self fontFamilyChooserBuild);
		yourself.

	^ element
]

{ #category : #layout }
SlmdLayoutView >> settingsSetUp [
	| element |

	element := #div asHtmlTag
		appendChild: (SlDrawer new
			id: 'smdSettings';
			label: 'Layout settings';
			"placement: 'top';"
			appendChild: self settingsPaneBuild;
			yourself);
		yourself.

	self replaceAllChildrenWith: element atSlotNamed: #'settings'.

]

{ #category : #settings }
SlmdLayoutView >> showBottomAppBar [

	^ self elementId: '#showBottomAppBar' propertyAt: #checked ifNotFound: true
]

{ #category : #settings }
SlmdLayoutView >> showBottomAppBar: aBoolean [

	self elementId: '#showBottomAppBar' propertyAt: #checked put: aBoolean
]

{ #category : #settings }
SlmdLayoutView >> showBottomAppBarBuildToggle [

	^ self
		newToggleId: 'showBottomAppBar'
		label: 'Show BottomAppBar'
		do: [
			self showBottomAppBar
				ifTrue: [ self bottomAppBarOn ]
				ifFalse: [ self bottomAppBarOff ].
			self useAutoLayout: false ].

]

{ #category : #settings }
SlmdLayoutView >> showSidesheet [

	^ self elementId: '#showSidesheet' propertyAt: #checked ifNotFound: true
]

{ #category : #settings }
SlmdLayoutView >> showSidesheet: aBoolean [

	self elementId: '#showSidesheet' propertyAt: #checked put: aBoolean
]

{ #category : #settings }
SlmdLayoutView >> showSidesheetBuildToggle [

	^ self
		newToggleId: 'showSidesheet'
		label: 'Show Sidesheet'
		do: [
			self sidesheetDisplay: self showSidesheet.
			self useAutoLayout: false ].

]

{ #category : #settings }
SlmdLayoutView >> showTopAppBar [

	^ self elementId: '#showTopAppBar' propertyAt: #checked ifNotFound: true
]

{ #category : #settings }
SlmdLayoutView >> showTopAppBar: aBoolean [

	self elementId: '#showTopAppBar' propertyAt: #checked put: aBoolean
]

{ #category : #settings }
SlmdLayoutView >> showTopAppBarBuildToggle [

	^ self
		newToggleId: 'showTopAppBar'
		label: 'Show TopAppBar'
		do: [
			self topAppBarDisplay: self showTopAppBar.
			self useAutoLayout: false ].

]

{ #category : #sidesheet }
SlmdLayoutView >> sidesheetBuild [

	^ #div asHtmlTag
		addClass: 'smd-sidesheet-container';
		appendChild: (#div asHtmlTag
			addClass: 'smd-sidesheet-content';
			appendChild: (#div asHtmlTag
				addClass: 'smd-sidesheet-card';
				appendChild: ('Sidesheet content...' inHtmlTag: #span);
				yourself);
			yourself);
		yourself

]

{ #category : #sidesheet }
SlmdLayoutView >> sidesheetDisplay: aBoolean [
	| element |

	element := self sidesheetFind.
	element ifNotNil: [
		aBoolean
			ifTrue: [ element removeStyleAt: 'display' ]
			ifFalse: [ element styleAt: 'display' put: 'none' ] ].

]

{ #category : #sidesheet }
SlmdLayoutView >> sidesheetFind [

	^ self shadowedElementWithId: 'smdSidesheet'
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

{ #category : #sidesheet }
SlmdLayoutView >> sidesheetSetUp [

	self
		replaceAllChildrenWith: self sidesheetBuild
		atSlotNamed: 'sidesheet'
]

{ #category : #events }
SlmdLayoutView >> topAppBarDisplay: anObject [
	| component |

	component := SlmdPaneLayoutView first.
	component ifNotNil: [
		component topAppBarDisplay: anObject ].

	self adaptWithAspect: #topAppBarDisplay value: anObject

]

{ #category : #events }
SlmdLayoutView >> topAppBarMenuDisplay: anObject [
	| components |

	components := SlmdTopAppBarView all.
	components do: [ :each |
		each topAppBarMenuDisplay: anObject ].

	self adaptWithAspect: #topAppBarMenuDisplay value: anObject

]

{ #category : #initialization }
SlmdLayoutView >> updateGlobalStyle [

	CpHtmlElement documentAddStyle: (self colorThemeFrom: self colorThemeName).

]

{ #category : #settings }
SlmdLayoutView >> useAutoLayout [

	^ self elementId: '#useAutoLayout' propertyAt: #checked ifNotFound: true
]

{ #category : #settings }
SlmdLayoutView >> useAutoLayout: aBoolean [

	self elementId: '#useAutoLayout' propertyAt: #checked put: aBoolean
]

{ #category : #settings }
SlmdLayoutView >> useAutoLayoutBuildToggle [

	^ self
		newToggleId: 'useAutoLayout'
		label: 'Use auto layout'
		do: [ self layoutAdaptToWidth ].

]

{ #category : #settings }
SlmdLayoutView >> useModalNav [

	^ self elementId: '#useModalNav' propertyAt: #checked ifNotFound: false
]

{ #category : #settings }
SlmdLayoutView >> useModalNav: aBoolean [

	self elementId: '#useModalNav' propertyAt: #checked put: aBoolean
]

{ #category : #settings }
SlmdLayoutView >> useModalNavBuildToggle [

	^ self
		newToggleId: 'useModalNav'
		label: 'Use modal navigation'
		do: [
			self navRegionModalAdapt: self useModalNav.
			self useAutoLayout: false ].

]

{ #category : #settings }
SlmdLayoutView >> useTwoPaneBody [

	^ self elementId: '#useTwoPaneBody' propertyAt: #checked ifNotFound: true
]

{ #category : #settings }
SlmdLayoutView >> useTwoPaneBody: aBoolean [

	self elementId: '#useTwoPaneBody' propertyAt: #checked put: aBoolean
]

{ #category : #settings }
SlmdLayoutView >> useTwoPaneBodyBuildToggle [

	^ self
		newToggleId: 'useTwoPaneBody'
		label: 'Use two pane layout'
		do: [
			self paneLayoutAdapt: self useTwoPaneBody ].

]

{ #category : #body }
SlmdLayoutView >> useTwoPanesChangeAutoResize: aBoolean [

	self useTwoPaneBody = aBoolean ifTrue: [
		^ self ].

	self useTwoPaneBody: aBoolean.
	self paneLayoutAdapt: aBoolean.

]

{ #category : #accessing }
SlmdLayoutView >> width [

	^ width
]

{ #category : #accessing }
SlmdLayoutView >> width: anObject [

	width := anObject
]
