Class {
	#name : #CpMaterial3LayoutView,
	#superclass : #CpView,
	#instVars : [
		'currentLayout',
		'pane2Hidden',
		'currentPage',
		'leadingAction',
		'trailingActions',
		'headline',
		'iconButtons',
		'fab',
		'navItems'
	],
	#category : #'CodeParadise-Examples-Shoelace-MaterialDesign3App'
}

{ #category : #'web resources' }
CpMaterial3LayoutView class >> globalStyle [

	<webResource: #css>

	^ self globalStyleExtra
, self globalStyleNav
, self globalStyleTopAppBar
, self globalStyleBottomAppBar
, self globalStyleSidesheet
, self globalStyleBody
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> globalStyleBody [

	<webResource: #css>

	^ '
.smd-body-content {
  font-family: var(--sl-font-sans);
  flex: auto;
  display: flex;  
  flex-direction: row;
  background: var(--sl-color-primary-100);
}

.smd-split-panel {
  flex: 100%;
  background: var(--sl-color-primary-100);
  margin: 0;
}

.smd-split-panel sl-split-panel::part(divider) {
  background-color: var(--sl-color-primary-100);
}

.smd-pane {
  flex: 100%;
  display: flex;  
  flex-direction: column;
  padding: 16px 0;
  margin: 0;
  text-align: left;
  overflow-x: auto;
  overflow-y: auto;
}

.smd-pane-1 {
  padding-left: 16px;
}

.smd-pane-2 {
  padding-right: 16px;
}

.smd-pane-content {
  border-radius: 16px;
  background: var(--sl-color-primary-200);
}

.example-settings-pane {
  padding: 6px;
}
'
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> globalStyleBottomAppBar [

	<webResource: #css>

	^ '
.smd-footer {
  flex: 0 0 72px;
  background: var(--sl-color-primary-200);
}

.smd-bottomAppBar {
  z-index: 10;
  display: flex;
  flex-flow: row wrap;
  padding: 12px 16px 12px 4px;
}

.smd-bottomAppBar-button {
  height: 48px;
  width: 48px;
  font-size: 24px;
}

.smd-bottomAppBar-fab {
  margin-left: auto;
  height: 48px;
  width: 48px;
  font-size: 24px;
  background: var(--sl-color-primary-300);
}
'
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> globalStyleExtra [

	<webResource: #css>

	^ '
.smd-attribute-container {
  padding: 12px;
}
'
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> globalStyleNav [

	<webResource: #css>

	^ '
.smd-navRegion {
  flex: 0 0 80px;
  padding: 0;
  margin: 0;
}

.smd-nav-font {
  line-height: var(--sl-line-height-normal);
  font-size: var(--sl-font-size-large);
  font-weight: var(--sl-font-weight-bold);
}

.smd-navrail {
  font-family: var(--sl-font-sans);
  padding: 0;
  margin: 0;
  background: var(--sl-color-primary-100);
}

.smd-navrail-item {
  display: flex;
  flex-flow: column;
  height: 56px;
  width: 80px;
  margin-top: 12px;
}

.smd-navrail-icon {
  padding: 0 16px;
  font-size: 24px;
}

.smd-navrail-labelText {
  padding: 0;
  line-height: 16pt;
  text-align: center;
  overflow-x: clip;
}

.smd-navdrawer {
  font-family: var(--sl-font-sans);
  padding: 12px 4px 0 12px;
  margin: 0;
  background: var(--sl-color-primary-100);
  flow-direction: row;
}

.smd-nav-drawer::part(panel) {
  background: var(--sl-color-primary-100);
}

.smd-navdrawer-headline {
  padding: 0 4px 12px 12px;
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
  padding-top: 8px;
  padding-left: 12px;
  width: 236px;
}
'
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> globalStyleSidesheet [

	<webResource: #css>

	^ '
.smd-sidesheet {
  padding: 0;
  margin-left: auto;
  max-width: 400px;
  background: var(--sl-color-primary-100);
}

.smd-sidesheet-container {
  padding: 0;
  margin: 0;
}

.smd-sidesheet-content {
  padding: 16px 16px 16px 0;
  width: 300px;
  height: 100%;
  background: var(--sl-color-primary-100);
}

.smd-sidesheet-card {
  border-radius: 16px;
  padding: 8px;
  background: var(--sl-color-primary-200);
}
'
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> globalStyleTopAppBar [

	<webResource: #css>

	^ '
.smd-header {
  border-radius: 16px;
  margin-bottom: 16px;
  flex: 0 0 64px;
  display: flex;  
  flex-direction: column;
  background: var(--sl-color-primary-200);
}

.smd-topAppBar {
  display: flex;
  flex-flow: row wrap;
  padding: 8px 4px 8px 4px;
}

.smd-topAppBar-leadingAction {
  margin-top: 4px;
  height: 48px;
  width: 48px;
  font-size: 24px;
}

.smd-topAppBar-headline {
  margin-top: 4px;
  padding-top: 8px;
  padding-left: 8px;
  height: 48px;
  font-size: 24px;
}

.smd-topAppBar-trailingActions {
  margin-left: auto;
  margin-top: 4px;
  height: 48px;
  font-size: 24px;
}
'
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> style [

	<webResource: #css>

	^ '
.smd-background {
  background: var(--sl-color-primary-100);
}

.smd-attribute-container {
  padding: 0 12px;
}
'
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> template [

	<webResource: #html>

	^ '
<div id="container">
<div id="smdLayout" class="smd-background">
  <div style="display: flex; flex-direction: column">
    <div style="flex: 1; display: flex; flex-direction: row">
      <div id="smdNavRegion" class="smd-navRegion">
        <slot name="navRegion"></slot>
      </div>
      <slot name="body"></slot>
      <aside id="smdSidesheet" class="smd-sidesheet">
        <slot name="sidesheet"></slot>
      </aside>
    </div>
    <footer id="smdBottomAppBar">
      <slot name="bottomAppBar"></slot>
    </footer>
  </div>
  <slot name="navModalPane"></slot>
</div>
</div>
'
]

{ #category : #utilities }
CpMaterial3LayoutView >> addAttributeContainerStyle: element [

	"^ #div asHtmlTag
		addClass: 'smd-attribute-container';
		appendChild: element
		yourself"
	^ element styleAt: 'padding' put: '12px'; yourself
]

{ #category : #bottomAppBar }
CpMaterial3LayoutView >> adjustBodyHeight [

	self bodyFind
		styleAt: 'height'
		put: (self showBottomAppBar ifTrue: [ 'calc(100vh - 72px)' ] ifFalse: [ '100vh' ]).
]

{ #category : #layout }
CpMaterial3LayoutView >> bodyFind [

	^ CpHtmlElement documentBody firstDescendantMatching: '#smdBodyContent'
]

{ #category : #layout }
CpMaterial3LayoutView >> bodySetUp [
	| split |

	split := SlSplitPanel new
		customPropertyAt: 'divider-width' put: '24px';
		"propertyAt: 'primary' put: 'start';"
		customPropertyAt: 'min' put: '400px';
		"customPropertyAt: 'max' put: 'calc(100% - 150px)';"
		replaceAllChildrenWith: (SlIcon named: 'grip-vertical') atSlotNamed: #'divider';
		yourself.

	split replaceAllChildrenWith: self pane1Build atSlotNamed: #'start'.

	self pane2Hidden
		ifTrue: [ split removeChildrenAtSlotNamed: #'end' ]
		ifFalse: [ split replaceAllChildrenWith: self pane2build atSlotNamed: #'end' ].

	self
		replaceAllChildrenWith: ((CpHtmlElement newWithTag: #div)
			id: 'smdBodyContent';
			addClass: 'smd-body-content';
			appendChild: ((CpHtmlElement newWithTag: #div)
				addClass: 'smd-split-panel';
				appendChild: split;
				yourself);
			yourself)
		atSlotNamed: #'body'
]

{ #category : #bottomAppBar }
CpMaterial3LayoutView >> bottomAppBarBuild [
	| element icons |

	icons := self iconButtons.

	element := #div asHtmlTag addClass: 'smd-bottomAppBar'; yourself.
	icons size >= 1 ifTrue: [
		element appendChild: (
			self buildIconButton: icons first class: 'smd-bottomAppBar-button') ].
	icons size >= 2 ifTrue: [
		element appendChild: (
			self buildIconButton: icons second class: 'smd-bottomAppBar-button') ].
	icons size >= 3 ifTrue: [
		element appendChild: (
			self buildIconButton: icons third class: 'smd-bottomAppBar-button') ].

	self fab notNil ifTrue: [
		element appendChild: (
			self buildIconButton: self fab class: 'smd-bottomAppBar-fab') ].

	^ #footer asHtmlTag
		addClass: 'smd-footer';
		appendChild: element;
		yourself

]

{ #category : #bottomAppBar }
CpMaterial3LayoutView >> bottomAppBarDisplay: aBoolean [
	| element |

	element := self bottomAppBarFind.
	element ifNotNil: [
		aBoolean
			ifTrue: [ element removeStyleAt: 'display' ]
			ifFalse: [ element styleAt: 'display' put: 'none' ] ].

]

{ #category : #bottomAppBar }
CpMaterial3LayoutView >> bottomAppBarFind [

	^ self shadowedElementWithId: 'smdBottomAppBar'
]

{ #category : #bottomAppBar }
CpMaterial3LayoutView >> bottomAppBarOff [

	self showBottomAppBar: false.
	self bottomAppBarDisplay: false.
	self adjustBodyHeight.

]

{ #category : #bottomAppBar }
CpMaterial3LayoutView >> bottomAppBarOn [

	self showBottomAppBar: true.
	self bottomAppBarDisplay: true.
	self adjustBodyHeight.

]

{ #category : #bottomAppBar }
CpMaterial3LayoutView >> bottomAppBarSetUp [

	self
		replaceAllChildrenWith: self bottomAppBarBuild
		atSlotNamed: 'bottomAppBar'.

]

{ #category : #bottomAppBar }
CpMaterial3LayoutView >> buildIconButton: iconName class: cssClass [

	^ (CpHtmlElement newWithTag: #div)
		addClass: cssClass;
		appendChild: (SlIconButton named: iconName);
		yourself
]

{ #category : #topAppBar }
CpMaterial3LayoutView >> buildLeadingAction [
	| drawer |

	drawer := self navModalPaneFind.

	^ (SlIconButton named: self leadingAction)
		when: CpClickEvent basicPrimary send: #show to: drawer;
		yourself

]

{ #category : #'nav - drawer' }
CpMaterial3LayoutView >> buildNavdrawerItem: buttonName methodName: methodName [

	^ #div asHtmlTag
		addClass: 'smd-navdrawer-item';
		addClass: 'smd-nav-font';
		when: CpClickEvent basicPrimary send: methodName to: self;
		appendChild: ((SlIconButton named: buttonName) addClass: 'smd-navdrawer-icon'; yourself);
		appendChild: (#div asHtmlTag
			addClass: 'smd-navdrawer-labelText';
			textContent: methodName;
			yourself);
		yourself
]

{ #category : #'nav - rail' }
CpMaterial3LayoutView >> buildNavrailItem: buttonName methodName: methodName [

	^ #div asHtmlTag
		addClass: 'smd-navrail-item';
		when: CpClickEvent basicPrimary send: methodName to: self;
		appendChild: (
			(SlIconButton named: buttonName)
				addClass: 'smd-navrail-icon';
				yourself);
		appendChild: (
			#div asHtmlTag
				addClass: 'smd-navrail-labelText';
				textContent: methodName;
				yourself);
		yourself
]

{ #category : #accessing }
CpMaterial3LayoutView >> currentLayout [

	^ currentLayout
]

{ #category : #accessing }
CpMaterial3LayoutView >> currentLayout: anObject [

	currentLayout := anObject
]

{ #category : #accessing }
CpMaterial3LayoutView >> currentPage [

	^ currentPage
]

{ #category : #accessing }
CpMaterial3LayoutView >> currentPage: anObject [

	currentPage := anObject
]

{ #category : #pages }
CpMaterial3LayoutView >> doClub [

	self setCurrentPage: 'Club'
]

{ #category : #pages }
CpMaterial3LayoutView >> doDiamond [

	self setCurrentPage: 'Diamond'.

]

{ #category : #pages }
CpMaterial3LayoutView >> doHeart [

	self setCurrentPage: 'Heart'
]

{ #category : #pages }
CpMaterial3LayoutView >> doSpade [

	self setCurrentPage: 'Spade'
]

{ #category : #utilities }
CpMaterial3LayoutView >> elementId: id propertyAt: key ifNotFound: defaultValue [
	| element |

	element := CpHtmlElement documentBody firstDescendantMatching: id.
	element ifNil: [ ^ defaultValue ].
	^ element propertyAt: key
]

{ #category : #utilities }
CpMaterial3LayoutView >> elementId: id propertyAt: key put: value [
	| element |

	element := CpHtmlElement documentBody firstDescendantMatching: id.
	element ifNotNil: [
		element propertyAt: key put: value ]
]

{ #category : #accessing }
CpMaterial3LayoutView >> fab [

	^ fab
]

{ #category : #accessing }
CpMaterial3LayoutView >> fab: anObject [

	fab := anObject
]

{ #category : #layout }
CpMaterial3LayoutView >> handleResizeEvent: anEvent [
	| el width |

	self useAutoLayout not ifTrue: [
		^ self ].

	anEvent detail valuesDo: [ :eachDetail |
		eachDetail do: [ :eachEntry |
			width := ((eachEntry apply: 'contentRect') apply: 'width') ] ].

	"el := CpHtmlElement documentBody firstDescendantMatching: '#smdPane1Content'.
	el appendChild: (width printString inHtmlTag: #p)."

	width < 600 ifTrue: [ ^ self layoutTypeChangeAutoResize: #compact ].
	width < 840 ifTrue: [ ^ self layoutTypeChangeAutoResize: #medium ].
	width < 1200 ifTrue: [ ^ self layoutTypeChangeAutoResize: #expanded ].
	width < 1600 ifTrue: [ ^ self layoutTypeChangeAutoResize: #large ].
	self layoutTypeChangeAutoResize: #'extra-large'.

]

{ #category : #accessing }
CpMaterial3LayoutView >> headline [

	^ headline
]

{ #category : #accessing }
CpMaterial3LayoutView >> headline: anObject [

	headline := anObject
]

{ #category : #accessing }
CpMaterial3LayoutView >> iconButtons [

	^ iconButtons
]

{ #category : #accessing }
CpMaterial3LayoutView >> iconButtons: anObject [

	iconButtons := anObject
]

{ #category : #initialization }
CpMaterial3LayoutView >> initialize [

	super initialize.

	"#layoutSetUp will set the value later. DO NOT set it here."
	"layoutType := nil."

	pane2Hidden := false.

	currentPage := 'Club'.

	navItems := {
'suit-club' -> #doClub.
'suit-diamond' -> #doDiamond.
'suit-heart' -> #doHeart.
'suit-spade' -> #doSpade
}
]

{ #category : #layout }
CpMaterial3LayoutView >> layoutSetUp [
	"Invoked by presenter's viewInitialize"

	self navModalPaneSetUp.
	self navSetUp.
	self bodySetUp.
	self sidesheetSetUp.
	self bottomAppBarSetUp.

	self layoutTypeAdapt: self layoutTypeDefault.
	self resizeSetUp.

]

{ #category : #settings }
CpMaterial3LayoutView >> layoutType [

	^ self elementId: '#smdLayoutTypeChooser' propertyAt: #value ifNotFound: self layoutTypeDefault
]

{ #category : #settings }
CpMaterial3LayoutView >> layoutType: aLayoutType [

	self elementId: '#smdLayoutTypeChooser' propertyAt: #value put: aLayoutType
]

{ #category : #layout }
CpMaterial3LayoutView >> layoutTypeAdapt: aLayoutType [

	self currentLayout = aLayoutType ifTrue: [
		^ self ].

	self currentLayout: aLayoutType.
	aLayoutType = #compact ifTrue: [
		self navRegionModalOn; bottomAppBarOn; sidesheetOff ].
	aLayoutType = #medium ifTrue: [
		self navRegionModalOn; bottomAppBarOn; sidesheetOff ].
	aLayoutType = #expanded ifTrue: [
		self navRegionModalOff; navTypeUseRail; bottomAppBarOff; sidesheetOff ].
	aLayoutType = #large ifTrue: [
		 self navRegionModalOff; navTypeUseDrawer; bottomAppBarOff; sidesheetOff ].
	aLayoutType = #'extra-large' ifTrue: [
		self navRegionModalOff; navTypeUseDrawer; bottomAppBarOff; sidesheetOn ].

]

{ #category : #settings }
CpMaterial3LayoutView >> layoutTypeBuildChooser [
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
CpMaterial3LayoutView >> layoutTypeChangeAutoResize: aLayoutType [

	self layoutType: aLayoutType.
	self layoutTypeAdapt: aLayoutType.

]

{ #category : #layout }
CpMaterial3LayoutView >> layoutTypeChangeManual: aLayoutType [

	self layoutTypeAdapt: aLayoutType.
	self useAutoLayout: false.
	self currentLayout: nil.

]

{ #category : #accessing }
CpMaterial3LayoutView >> layoutTypeDefault [

	^ #expanded
]

{ #category : #accessing }
CpMaterial3LayoutView >> leadingAction [

	^ leadingAction
]

{ #category : #accessing }
CpMaterial3LayoutView >> leadingAction: anObject [

	leadingAction := anObject
]

{ #category : #nav }
CpMaterial3LayoutView >> navContentBuild [

	self navTypeIsDrawer ifTrue: [
		^ self navdrawerBuild ].

	^ self navrailBuild
]

{ #category : #accessing }
CpMaterial3LayoutView >> navItems [

	^ navItems
]

{ #category : #accessing }
CpMaterial3LayoutView >> navItems: anObject [

	navItems := anObject
]

{ #category : #nav }
CpMaterial3LayoutView >> navModalPaneBuild [
	| drawer |

	drawer := SlDrawer new
		id: 'smdNavModalPane';
		addClass: 'smd-nav-drawer';
		placement: 'start';
		beNoHeader;
		customPropertyAt: 'size' put: self navModalPaneWidth;
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
CpMaterial3LayoutView >> navModalPaneContentFind [

	^ CpHtmlElement documentBody firstDescendantMatching: '#smdNavModalPaneContent'
]

{ #category : #nav }
CpMaterial3LayoutView >> navModalPaneFind [

	^ CpHtmlElement documentBody firstDescendantMatching: '#smdNavModalPane'
]

{ #category : #nav }
CpMaterial3LayoutView >> navModalPaneSetUp [

	self replaceAllChildrenWith: self navModalPaneBuild atSlotNamed: #'navModalPane'

]

{ #category : #nav }
CpMaterial3LayoutView >> navModalPaneWidth [

	self navTypeIsRail ifTrue: [ ^ '80px' ].
	self navTypeIsDrawer ifTrue: [ ^ '360px' ].
	self navTypeIsBar ifTrue: [ ^ '0' ].
	^ '80px'
]

{ #category : #nav }
CpMaterial3LayoutView >> navRegionDisplay: aBoolean [
	| element |

	element := self navRegionFind.
	element ifNotNil: [
		aBoolean
			ifTrue: [ element styleAt: 'display' put: 'none' ]
			ifFalse: [ element removeStyleAt: 'display' ] ].

]

{ #category : #nav }
CpMaterial3LayoutView >> navRegionFind [

	"^ CpHtmlElement documentBody firstDescendantMatching: '#smdNavRegion'"
	^ self shadowedElementWithId: 'smdNavRegion'
]

{ #category : #nav }
CpMaterial3LayoutView >> navRegionModalAdapt: isOn [

	isOn
		ifTrue: [
			self navRegionDisplay: true.
			self topAppBarMenuDisplay: false ]
		ifFalse: [
			self navRegionDisplay: false.
			self topAppBarMenuDisplay: true ].

	self navSetUp.

]

{ #category : #nav }
CpMaterial3LayoutView >> navRegionModalOff [

	self useModalNav: false.
	self navRegionModalAdapt: false.

]

{ #category : #nav }
CpMaterial3LayoutView >> navRegionModalOn [

	self useModalNav: true.
	self navRegionModalAdapt: true.

]

{ #category : #nav }
CpMaterial3LayoutView >> navSetUp [

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
CpMaterial3LayoutView >> navType [

	^ self elementId: '#smdNavTypeChooser' propertyAt: #value ifNotFound: self navTypeDefault
]

{ #category : #settings }
CpMaterial3LayoutView >> navType: aNavType [

	^ self elementId: '#smdNavTypeChooser' propertyAt: #value put: aNavType
]

{ #category : #nav }
CpMaterial3LayoutView >> navTypeAdapt: aNavType [

	self navRegionFind
		styleAt: 'flex'
		put: '0 0 ', self navModalPaneWidth.

	self navModalPaneFind
		customPropertyAt: 'size'
		put: self navModalPaneWidth.

	self navSetUp.

]

{ #category : #nav }
CpMaterial3LayoutView >> navTypeBeBar [

	self navType: #bar
]

{ #category : #nav }
CpMaterial3LayoutView >> navTypeBeDrawer [

	self navType: #drawer
]

{ #category : #nav }
CpMaterial3LayoutView >> navTypeBeRail [

	self navType: #rail
]

{ #category : #settings }
CpMaterial3LayoutView >> navTypeBuildChooser [
	| radioGroup |

	radioGroup := SlRadioGroup new
		id: 'smdNavTypeChooser';
		addClass: 'smd-attribute-container';
		styleAt: 'padding' put: '8px';
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
CpMaterial3LayoutView >> navTypeDefault [

	^ #rail
]

{ #category : #nav }
CpMaterial3LayoutView >> navTypeIsBar [

	^ self navType = #bar
]

{ #category : #nav }
CpMaterial3LayoutView >> navTypeIsDrawer [

	^ self navType = #drawer
]

{ #category : #nav }
CpMaterial3LayoutView >> navTypeIsRail [

	^ self navType = #rail
]

{ #category : #nav }
CpMaterial3LayoutView >> navTypeUseDrawer [

	self navTypeBeDrawer.
	self navTypeAdapt: #drawer.

]

{ #category : #nav }
CpMaterial3LayoutView >> navTypeUseRail [

	self navTypeBeRail.
	self navTypeAdapt: #rail.

]

{ #category : #'nav - drawer' }
CpMaterial3LayoutView >> navdrawerBuild [
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
			navItem := self buildNavdrawerItem: eachItem key methodName: eachItem value.
			navItem when: CpClickEvent basicPrimary send: #hide to: drawer.
			element appendChild: navItem ] ].

	^ #nav asHtmlTag
		appendChild: element;
		yourself
]

{ #category : #'nav - rail' }
CpMaterial3LayoutView >> navrailBuild [
	| element drawer |

	drawer := self navModalPaneFind.

	element := #div asHtmlTag addClass: 'smd-navrail'; yourself.
	navItems ifNotNil: [
		navItems do: [ :eachItem | | navItem |
			navItem := self buildNavrailItem: eachItem key methodName: eachItem value.
			navItem when: CpClickEvent basicPrimary send: #hide to: drawer.
			element appendChild: navItem ] ].

	^ #nav asHtmlTag
		appendChild: element;
		yourself
]

{ #category : #utilities }
CpMaterial3LayoutView >> newToggleId: id label: label do: aBlock [
	| toggle |

	toggle := SlSwitch new
		id: id;
		label: label;
		checked: true;
		when: SlChangeEvent do: aBlock for: self;
		yourself.

	^ (CpHtmlElement newWithTag: #div) appendChild: toggle; yourself.

]

{ #category : #layout }
CpMaterial3LayoutView >> pane1Build [
	| element |

	element := #div asHtmlTag
		addClass: 'smd-pane';
		addClass: 'smd-pane-1';
		yourself.

	element appendChild: self topAppBarBuild.
	self topAppBarDisplay: self showTopAppBarIsOn.

	element
		appendChild: (#div asHtmlTag
			id: 'smdPane1Content';
			addClass: 'smd-pane-content';
			appendChild: (self currentPage inHtmlTag: #p);
			yourself);
		yourself.

	^ element

]

{ #category : #accessing }
CpMaterial3LayoutView >> pane2Hidden [

	^ pane2Hidden
]

{ #category : #accessing }
CpMaterial3LayoutView >> pane2Hidden: anObject [

	pane2Hidden := anObject
]

{ #category : #layout }
CpMaterial3LayoutView >> pane2build [

	^ self settingsPaneBuild
]

{ #category : #layout }
CpMaterial3LayoutView >> resizeSetUp [
	| target div resize |

	target := (self shadowedElementWithId: 'smdLayout').
	div := target firstChild.
	resize := SlResizeObserver new.
	resize when: SlResizeEvent send: #handleResizeEvent: to: self.
	target replaceChild: div with: resize.
	resize appendChild: div.

]

{ #category : #pages }
CpMaterial3LayoutView >> setCurrentPage: aString [
	| element |

	currentPage := aString.

	element := CpHtmlElement documentBody firstDescendantMatching: '#smdPane1Content'.
	element notNil ifTrue: [
		element replaceAllChildrenWith: (currentPage inHtmlTag: #h1) ]

]

{ #category : #settings }
CpMaterial3LayoutView >> settingsPaneBuild [
	| element |

	element := #div asHtmlTag
		addClass: 'example-settings-pane';
		appendChild: ('Layout Settings' inHtmlTag: #h3);
		appendChild: (self addAttributeContainerStyle: self useModalNavBuildToggle);
		appendChild: (self addAttributeContainerStyle: self useAutoLayoutBuildToggle);
		appendChild: (self addAttributeContainerStyle: self layoutTypeBuildChooser);
		appendChild: (self addAttributeContainerStyle: self navTypeBuildChooser);
		appendChild: (self addAttributeContainerStyle: self showTopAppBarBuildToggle);
		appendChild: (self addAttributeContainerStyle: self showBottomAppBarBuildToggle);
		appendChild: (self addAttributeContainerStyle: self showSidesheetBuildToggle);
		yourself.

	^ #div asHtmlTag
		addClass: 'smd-pane';
		addClass: 'smd-pane-2';
		appendChild: (#div asHtmlTag
			addClass: 'smd-pane-content';
			appendChild: element;
			yourself);
		yourself
]

{ #category : #settings }
CpMaterial3LayoutView >> showBottomAppBar [

	^ self elementId: '#showBottomAppBar' propertyAt: #checked ifNotFound: true
]

{ #category : #settings }
CpMaterial3LayoutView >> showBottomAppBar: aBoolean [

	self elementId: '#showBottomAppBar' propertyAt: #checked put: aBoolean
]

{ #category : #settings }
CpMaterial3LayoutView >> showBottomAppBarBuildToggle [

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
CpMaterial3LayoutView >> showSidesheet [

	^ self elementId: '#showSidesheet' propertyAt: #checked ifNotFound: true
]

{ #category : #settings }
CpMaterial3LayoutView >> showSidesheet: aBoolean [

	self elementId: '#showSidesheet' propertyAt: #checked put: aBoolean
]

{ #category : #settings }
CpMaterial3LayoutView >> showSidesheetBuildToggle [

	^ self
		newToggleId: 'showSidesheet'
		label: 'Show Sidesheet'
		do: [
			self sidesheetDisplay: self showSidesheet.
			self useAutoLayout: false ].

]

{ #category : #settings }
CpMaterial3LayoutView >> showTopAppBar [

	^ self elementId: '#showTopAppBar' propertyAt: #checked ifNotFound: true
]

{ #category : #settings }
CpMaterial3LayoutView >> showTopAppBar: aBoolean [

	self elementId: '#showTopAppBar' propertyAt: #checked put: aBoolean
]

{ #category : #settings }
CpMaterial3LayoutView >> showTopAppBarBuildToggle [

	^ self
		newToggleId: 'showTopAppBar'
		label: 'Show TopAppBar'
		do: [
			self topAppBarDisplay: self showTopAppBarFind isChecked.
			self useAutoLayout: false ].

]

{ #category : #settings }
CpMaterial3LayoutView >> showTopAppBarFind [

	^ CpHtmlElement documentBody firstDescendantMatching: '#showTopAppBar'

]

{ #category : #settings }
CpMaterial3LayoutView >> showTopAppBarIsOff [
	| element |

	element := self showTopAppBarFind.
	^ element ifNil: [ true ] ifNotNil: [ element isChecked not ]
]

{ #category : #settings }
CpMaterial3LayoutView >> showTopAppBarIsOn [
	| element |

	element := self showTopAppBarFind.
	^ element ifNil: [ false ] ifNotNil: [ element isChecked ]

]

{ #category : #sidesheet }
CpMaterial3LayoutView >> sidesheetBuild [

	^ #div asHtmlTag
		addClass: 'smd-sidesheet-container';
		appendChild: (#div asHtmlTag
			addClass: 'smd-sidesheet-content';
			appendChild: (#div asHtmlTag
				addClass: 'smd-sidesheet-card';
				appendChild: ('Lorem ipsum...' inHtmlTag: #span);
				yourself);
			yourself);
		yourself

]

{ #category : #sidesheet }
CpMaterial3LayoutView >> sidesheetDisplay: aBoolean [
	| element |

	element := self sidesheetFind.
	element ifNotNil: [
		aBoolean
			ifTrue: [ element removeStyleAt: 'display' ]
			ifFalse: [ element styleAt: 'display' put: 'none' ] ].

]

{ #category : #sidesheet }
CpMaterial3LayoutView >> sidesheetFind [

	^ self shadowedElementWithId: 'smdSidesheet'
]

{ #category : #sidesheet }
CpMaterial3LayoutView >> sidesheetOff [

	self showSidesheet: false.
	self sidesheetDisplay: false.

]

{ #category : #sidesheet }
CpMaterial3LayoutView >> sidesheetOn [

	self showSidesheet: true.
	self sidesheetDisplay: true.

]

{ #category : #sidesheet }
CpMaterial3LayoutView >> sidesheetSetUp [

	self
		replaceAllChildrenWith: self sidesheetBuild
		atSlotNamed: 'sidesheet'
]

{ #category : #topAppBar }
CpMaterial3LayoutView >> topAppBarBuild [
	| trailing |

	trailing := self trailingActions.

	^ #header asHtmlTag
		id: 'smdTopAppBar';
		addClass: 'smd-header';
		appendChild: (#div asHtmlTag
			addClass: 'smd-topAppBar';
			appendChild: (#div asHtmlTag
				addClass: 'smd-topAppBar-leadingAction';
				appendChild: self buildLeadingAction;
				yourself);
			appendChild: (#div asHtmlTag
				addClass: 'smd-topAppBar-headline';
				appendChild: (self headline inHtmlTag: #span);
				yourself);
			appendChild: (#div asHtmlTag
				addClass: 'smd-topAppBar-trailingActions';
				appendChild: (SlIconButton named: trailing first);
				appendChild: (SlIconButton named: trailing second);
				appendChild: (SlIconButton named: trailing third);
				yourself);
			yourself);
		yourself
]

{ #category : #topAppBar }
CpMaterial3LayoutView >> topAppBarDisplay: aBoolean [
	| element |

	element := self topAppBarFind.
	element ifNotNil: [
		aBoolean
			ifTrue: [ element removeStyleAt: 'display' ]
			ifFalse: [ element styleAt: 'display' put: 'none' ] ].

]

{ #category : #topAppBar }
CpMaterial3LayoutView >> topAppBarFind [

	^ CpHtmlElement documentBody firstDescendantMatching: '#smdTopAppBar'
]

{ #category : #topAppBar }
CpMaterial3LayoutView >> topAppBarMenuDisplay: aBoolean [
	| element |

	element := self topAppBarMenuFind.
	element ifNotNil: [
		aBoolean
			ifTrue: [ element styleAt: 'display' put: 'none' ]
			ifFalse: [ element removeStyleAt: 'display' ] ].

]

{ #category : #topAppBar }
CpMaterial3LayoutView >> topAppBarMenuFind [

	^ CpHtmlElement documentBody firstDescendantMatching: '.smd-topAppBar-leadingAction'
]

{ #category : #accessing }
CpMaterial3LayoutView >> trailingActions [

	^ trailingActions
]

{ #category : #accessing }
CpMaterial3LayoutView >> trailingActions: anObject [

	trailingActions := anObject
]

{ #category : #settings }
CpMaterial3LayoutView >> useAutoLayout [

	^ self elementId: '#useAutoLayout' propertyAt: #checked ifNotFound: true
]

{ #category : #settings }
CpMaterial3LayoutView >> useAutoLayout: aBoolean [

	self elementId: '#useAutoLayout' propertyAt: #checked put: aBoolean
]

{ #category : #settings }
CpMaterial3LayoutView >> useAutoLayoutBuildToggle [

	^ self
		newToggleId: 'useAutoLayout'
		label: 'Use auto layout'
		do: [].

]

{ #category : #settings }
CpMaterial3LayoutView >> useModalNav [

	^ self elementId: '#useModalNav' propertyAt: #checked ifNotFound: false
]

{ #category : #settings }
CpMaterial3LayoutView >> useModalNav: aBoolean [

	self elementId: '#useModalNav' propertyAt: #checked put: aBoolean
]

{ #category : #settings }
CpMaterial3LayoutView >> useModalNavBuildToggle [

	^ self
		newToggleId: 'useModalNav'
		label: 'Use modal navigation'
		do: [
			self navRegionModalAdapt: self useModalNav.
			self useAutoLayout: false ].

]
