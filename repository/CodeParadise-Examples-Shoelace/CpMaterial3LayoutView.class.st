Class {
	#name : #CpMaterial3LayoutView,
	#superclass : #CpView,
	#instVars : [
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

	^ self globalStyleNav
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
CpMaterial3LayoutView class >> globalStyleNav [

	<webResource: #css>

	^ '
.smd-navRegion {
  flex: 0 0 80px;
}

.smd-nav-font {
  line-height: var(--sl-line-height-normal);
  font-size: var(--sl-font-size-large);
  font-weight: var(--sl-font-weight-bold);
}

ul.smd-navrail {
  font-family: var(--sl-font-sans);
  list-style: none;
  padding: 0;
  margin: 0;
  background: var(--sl-color-primary-200);
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

.smd-navdrawer-headline {
  padding: 0 4px 12px 28px;
}

.smd-navdrawer-item {
  display: flex;
  border-radius: 28px;
  height: 56px;
  background: var(--sl-color-primary-200);
}

.smd-navdrawer-icon {
  padding-top: 8px;
  padding-left: 16px;
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

	^ ''
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> template [

	<webResource: #html>

	^ '
<div id="container">
<div id="smdLayout">
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
</div>
<slot name="navModalPane"></slot>
</div>
'
]

{ #category : #bottomAppBar }
CpMaterial3LayoutView >> adjustBodyHeight [

	self bodyFind
		styleAt: 'height'
		put: (self showBottomAppBarIsOn ifTrue: [ 'calc(100vh - 72px)' ] ifFalse: [ '100vh' ]).
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

	element := (CpHtmlElement newWithTag: #div) addClass: 'smd-bottomAppBar'; yourself.
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

	^ (CpHtmlElement newWithTag: #footer)
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

{ #category : #settings }
CpMaterial3LayoutView >> buildLayoutTypeChooser [
	| radioGroup |

	radioGroup := SlRadioGroup new
		id: 'layoutTypeChooser';
		propertyAt: 'label' put: 'Choose a layout style';
		propertyAt: 'value' put: self layoutTypeDefault;
		yourself.

	radioGroup when: SlChangeEvent do: [ self layoutTypeChangeManual: radioGroup value ] for: self.

	radioGroup appendChild: (SlRadioButton new value: #compact; textContent: 'Compact'; yourself).
	radioGroup appendChild: (SlRadioButton new value: #medium; textContent: 'Medium'; yourself).
	radioGroup appendChild: (SlRadioButton new value: #expanded; textContent: 'Expanded'; yourself).
	radioGroup appendChild: (SlRadioButton new value: #large; textContent: 'Large'; yourself).
	radioGroup appendChild: (SlRadioButton new value: #'extra-large'; textContent: 'Extra-large'; yourself).

	^ ((CpHtmlElement newWithTag: #div) appendChild: radioGroup; yourself)
]

{ #category : #topAppBar }
CpMaterial3LayoutView >> buildLeadingAction [
	| drawer |

	drawer := self navModalPaneFind.

	^ (SlIconButton named: self leadingAction)
		when: CpClickEvent basicPrimary send: #show to: drawer;
		yourself

]

{ #category : #settings }
CpMaterial3LayoutView >> buildNavTypeChooser [
	| radioGroup |

	radioGroup := SlRadioGroup new
		id: 'navTypeChooser';
		propertyAt: 'label' put: 'Choose a navigation type';
		propertyAt: 'value' put: self navTypeDefault;
		yourself.

	radioGroup when: SlChangeEvent do: [ self navTypeSet: radioGroup value ] for: self.

	radioGroup appendChild: (SlRadioButton new value: #rail; textContent: 'Rail'; yourself).
	radioGroup appendChild: (SlRadioButton new value: #drawer; textContent: 'Drawer'; yourself).
	radioGroup appendChild: (SlRadioButton new value: #bar; textContent: 'Bar'; beDisabled; yourself).

	^ ((CpHtmlElement newWithTag: #div) appendChild: radioGroup; yourself)
]

{ #category : #'nav - drawer' }
CpMaterial3LayoutView >> buildNavdrawerItem: buttonName methodName: methodName [

	^ (CpHtmlElement newWithTag: #div)
		addClass: 'smd-navdrawer-item';
		addClass: 'smd-nav-font';
		when: CpClickEvent basicPrimary send: methodName to: self;
		appendChild: ((SlIconButton named: buttonName) addClass: 'smd-navdrawer-icon'; yourself);
		appendChild: ((CpHtmlElement newWithTag: #div)
			addClass: 'smd-navdrawer-labelText';
			textContent: methodName;
			yourself);
		yourself
]

{ #category : #'nav - rail' }
CpMaterial3LayoutView >> buildNavrailItem: buttonName methodName: methodName [

	^ (CpHtmlElement newWithTag: #div)
		addClass: 'smd-navrail-item';
		when: CpClickEvent basicPrimary send: methodName to: self;
		appendChild: (
			(SlIconButton named: buttonName)
				addClass: 'smd-navrail-icon';
				yourself);
		appendChild: (
			(CpHtmlElement newWithTag: #div)
				addClass: 'smd-navrail-labelText';
				textContent: methodName;
				yourself);
		yourself
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

	self useAutoLayoutIsOff ifTrue: [
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

	self layoutTypeSet: self layoutTypeDefault.
	self resizeSetUp.

]

{ #category : #layout }
CpMaterial3LayoutView >> layoutType [
	| element |

	element := self layoutTypeFind.
	^ element ifNil: [ nil ] ifNotNil: [ element value ]
]

{ #category : #layout }
CpMaterial3LayoutView >> layoutType: aLayoutType [

	self layoutTypeFind propertyAt: #value put: aLayoutType
]

{ #category : #layout }
CpMaterial3LayoutView >> layoutTypeChangeAutoResize: aLayoutType [

	self layoutTypeSet: aLayoutType.

	self layoutType: aLayoutType.

]

{ #category : #layout }
CpMaterial3LayoutView >> layoutTypeChangeManual: aLayoutType [

	self layoutTypeSet: aLayoutType.

	self useAutoLayout: false.

]

{ #category : #accessing }
CpMaterial3LayoutView >> layoutTypeDefault [

	^ #expanded
]

{ #category : #layout }
CpMaterial3LayoutView >> layoutTypeFind [

	^ CpHtmlElement documentBody firstDescendantMatching: '#layoutTypeChooser'

]

{ #category : #layout }
CpMaterial3LayoutView >> layoutTypeSet: aLayoutType [

	aLayoutType = #compact ifTrue: [
		self navRegionModalOn; bottomAppBarOn; sidesheetOff ].
	aLayoutType = #medium ifTrue: [
		self navRegionModalOn; bottomAppBarOn; sidesheetOff ].
	aLayoutType = #expanded ifTrue: [
		self navRegionModalOff; bottomAppBarOff; sidesheetOff ].
	aLayoutType = #large ifTrue: [
		 self navRegionModalOff; bottomAppBarOff; sidesheetOff ].
	aLayoutType = #'extra-large' ifTrue: [
		self navRegionModalOff; bottomAppBarOff; sidesheetOn ].

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
CpMaterial3LayoutView >> navRegionModalOff [

	self useModalNav: false.
	self navRegionDisplay: false.
	self topAppBarMenuDisplay: true.
	self navSetUp.

]

{ #category : #nav }
CpMaterial3LayoutView >> navRegionModalOn [

	self useModalNav: true.
	self navRegionDisplay: true.
	self topAppBarMenuDisplay: false.
	self navSetUp.

]

{ #category : #nav }
CpMaterial3LayoutView >> navSetUp [

	self useModalNavIsOn
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

{ #category : #nav }
CpMaterial3LayoutView >> navType [
	| element |

	element := self navTypeFind.
	^ element ifNil: [ nil ] ifNotNil: [ element value ]
]

{ #category : #nav }
CpMaterial3LayoutView >> navType: aNavType [

	self navTypeFind propertyAt: #value put: aNavType
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

{ #category : #nav }
CpMaterial3LayoutView >> navTypeDefault [

	^ #rail
]

{ #category : #nav }
CpMaterial3LayoutView >> navTypeFind [

	^ CpHtmlElement documentBody firstDescendantMatching: '#navTypeChooser'

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
CpMaterial3LayoutView >> navTypeSet: aNavType [

	self navRegionFind
		styleAt: 'flex'
		put: '0 0 ', self navModalPaneWidth.

	self navModalPaneFind
		customPropertyAt: 'size'
		put: self navModalPaneWidth.

	self navSetUp.

]

{ #category : #'nav - drawer' }
CpMaterial3LayoutView >> navdrawerBuild [
	| element drawer |

	drawer := self navModalPaneFind.

	element := CpHtmlElement newWithTag: #div.
	element addClass: 'smd-navdrawer'.
	element appendChild: ((CpHtmlElement newWithTag: #div)
		addClass: 'smd-navdrawer-headline';
		addClass: 'smd-nav-font';
		textContent: 'Headline';
		yourself).
	navItems ifNotNil: [
		navItems do: [ :eachItem | | navItem |
			navItem := self buildNavdrawerItem: eachItem key methodName: eachItem value.
			navItem when: CpClickEvent basicPrimary send: #hide to: drawer.
			element appendChild: navItem ] ].

	^ (CpHtmlElement newWithTag: #nav)
		appendChild: element;
		yourself
]

{ #category : #'nav - rail' }
CpMaterial3LayoutView >> navrailBuild [
	| element drawer |

	drawer := self navModalPaneFind.

	element := CpHtmlElement newWithTag: #ul.
	element addClass: 'smd-navrail'.
	navItems ifNotNil: [
		navItems do: [ :eachItem | | navItem |
			navItem := self buildNavrailItem: eachItem key methodName: eachItem value.
			navItem when: CpClickEvent basicPrimary send: #hide to: drawer.
			element appendChild: navItem ] ].

	^ (CpHtmlElement newWithTag: #nav)
		appendChild: element;
		yourself
]

{ #category : #settings }
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

	element := (CpHtmlElement newWithTag: #div)
		addClass: 'smd-pane';
		addClass: 'smd-pane-1';
		yourself.

	element appendChild: self topAppBarBuild.
	self topAppBarDisplay: self showTopAppBarIsOn.

	element
		appendChild: ((CpHtmlElement newWithTag: #div)
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

{ #category : #settings }
CpMaterial3LayoutView >> setChecked: aBoolean domId: id [
	| el |

	el := CpHtmlElement documentBody firstDescendantMatching: id.
	el ifNotNil: [
		el checked: aBoolean ]
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

	element := (CpHtmlElement newWithTag: #div)
		addClass: 'example-settings-pane';
		appendChild: ('Layout Settings' inHtmlTag: #h3);
		appendChild: self useAutoLayoutBuildToggle;
		appendChild: self buildLayoutTypeChooser;
		appendChild: self buildNavTypeChooser;
		appendChild: self useModalNavBuildToggle;
		appendChild: self showTopAppBarBuildToggle;
		appendChild: self showBottomAppBarBuildToggle;
		appendChild: self showSidesheetBuildToggle;
		yourself.

	^ (CpHtmlElement newWithTag: #div)
		addClass: 'smd-pane';
		addClass: 'smd-pane-2';
		appendChild: ((CpHtmlElement newWithTag: #div)
			addClass: 'smd-pane-content';
			appendChild: element;
			yourself);
		yourself
]

{ #category : #bottomAppBar }
CpMaterial3LayoutView >> showBottomAppBar: aBoolean [

	self showBottomAppBarFind checked: aBoolean
]

{ #category : #settings }
CpMaterial3LayoutView >> showBottomAppBarBuildToggle [

	^ self
		newToggleId: 'showBottomAppBar'
		label: 'Show BottomAppBar'
		do: [
			self showBottomAppBarFind isChecked
				ifTrue: [ self bottomAppBarOn ]
				ifFalse: [ self bottomAppBarOff ].
			self useAutoLayout: false ].

]

{ #category : #bottomAppBar }
CpMaterial3LayoutView >> showBottomAppBarFind [

	^ CpHtmlElement documentBody firstDescendantMatching: '#showBottomAppBar'

]

{ #category : #bottomAppBar }
CpMaterial3LayoutView >> showBottomAppBarIsOff [
	| element |

	element := self showBottomAppBarFind.
	^ element ifNil: [ true ] ifNotNil: [ element isChecked not ]
]

{ #category : #bottomAppBar }
CpMaterial3LayoutView >> showBottomAppBarIsOn [
	| element |

	element := self showBottomAppBarFind.
	^ element ifNil: [ false ] ifNotNil: [ element isChecked ]

]

{ #category : #sidesheet }
CpMaterial3LayoutView >> showSidesheet: aBoolean [

	self showSidesheetFind checked: aBoolean
]

{ #category : #settings }
CpMaterial3LayoutView >> showSidesheetBuildToggle [

	^ self
		newToggleId: 'showSidesheet'
		label: 'Show Sidesheet'
		do: [
			self showSidesheetFind isChecked
				ifTrue: [ self sidesheetOn ]
				ifFalse: [ self sidesheetOff ].
			self useAutoLayout: false ].

]

{ #category : #sidesheet }
CpMaterial3LayoutView >> showSidesheetFind [

	^ CpHtmlElement documentBody firstDescendantMatching: '#showSidesheet'

]

{ #category : #sidesheet }
CpMaterial3LayoutView >> showSidesheetIsOff [
	| element |

	element := self showSidesheetFind.
	^ element ifNil: [ true ] ifNotNil: [ element isChecked not ]
]

{ #category : #sidesheet }
CpMaterial3LayoutView >> showSidesheetIsOn [
	| element |

	element := self showSidesheetFind.
	^ element ifNil: [ false ] ifNotNil: [ element isChecked ]

]

{ #category : #topAppBar }
CpMaterial3LayoutView >> showTopAppBar: aBoolean [

	self showTopAppBarFind checked: aBoolean
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

{ #category : #topAppBar }
CpMaterial3LayoutView >> showTopAppBarFind [

	^ CpHtmlElement documentBody firstDescendantMatching: '#showTopAppBar'

]

{ #category : #topAppBar }
CpMaterial3LayoutView >> showTopAppBarIsOff [
	| element |

	element := self showTopAppBarFind.
	^ element ifNil: [ true ] ifNotNil: [ element isChecked not ]
]

{ #category : #topAppBar }
CpMaterial3LayoutView >> showTopAppBarIsOn [
	| element |

	element := self showTopAppBarFind.
	^ element ifNil: [ false ] ifNotNil: [ element isChecked ]

]

{ #category : #sidesheet }
CpMaterial3LayoutView >> sidesheetBuild [

	^ (CpHtmlElement newWithTag: #div)
		addClass: 'smd-sidesheet-container';
		appendChild: ((CpHtmlElement newWithTag: #div)
			addClass: 'smd-sidesheet-content';
			appendChild: ((CpHtmlElement newWithTag: #div)
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

	^ (CpHtmlElement newWithTag: #header)
		id: 'smdTopAppBar';
		addClass: 'smd-header';
		appendChild: ((CpHtmlElement newWithTag: #div)
			addClass: 'smd-topAppBar';
			appendChild: ((CpHtmlElement newWithTag: #div)
				addClass: 'smd-topAppBar-leadingAction';
				appendChild: self buildLeadingAction;
				yourself);
			appendChild: ((CpHtmlElement newWithTag: #div)
				addClass: 'smd-topAppBar-headline';
				appendChild: (self headline inHtmlTag: #span);
				yourself);
			appendChild: ((CpHtmlElement newWithTag: #div)
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

{ #category : #layout }
CpMaterial3LayoutView >> useAutoLayout: aBoolean [

	self useAutoLayoutFind checked: aBoolean
]

{ #category : #settings }
CpMaterial3LayoutView >> useAutoLayoutBuildToggle [

	^ self
		newToggleId: 'useAutoLayout'
		label: 'Use Auto Layout'
		do: [].

]

{ #category : #layout }
CpMaterial3LayoutView >> useAutoLayoutFind [

	^ CpHtmlElement documentBody firstDescendantMatching: '#useAutoLayout'

]

{ #category : #layout }
CpMaterial3LayoutView >> useAutoLayoutIsOff [

	^ self useAutoLayoutFind isChecked not
]

{ #category : #layout }
CpMaterial3LayoutView >> useAutoLayoutIsOn [

	^ self useAutoLayoutFind isChecked

]

{ #category : #nav }
CpMaterial3LayoutView >> useModalNav: aBoolean [

	self useModalNavFind checked: aBoolean
]

{ #category : #settings }
CpMaterial3LayoutView >> useModalNavBuildToggle [

	^ self
		newToggleId: 'useModalNav'
		label: 'Use Modal Navigation'
		do: [
			self useModalNavFind isChecked
				ifTrue: [ self navRegionModalOn ]
				ifFalse: [ self navRegionModalOff ].
			self useAutoLayout: false ].

]

{ #category : #nav }
CpMaterial3LayoutView >> useModalNavFind [

	^ CpHtmlElement documentBody firstDescendantMatching: '#useModalNav'

]

{ #category : #nav }
CpMaterial3LayoutView >> useModalNavIsOff [
	| element |

	element := self useModalNavFind.
	^ element ifNil: [ true ] ifNotNil: [ element isChecked not ]
]

{ #category : #nav }
CpMaterial3LayoutView >> useModalNavIsOn [
	| element |

	element := self useModalNavFind.
	^ element ifNil: [ false ] ifNotNil: [ element isChecked ]

]
