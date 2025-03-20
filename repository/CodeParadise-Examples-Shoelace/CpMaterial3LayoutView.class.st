Class {
	#name : #CpMaterial3LayoutView,
	#superclass : #CpView,
	#instVars : [
		'pane2Hidden',
		'sidesheetHidden',
		'topAppBarHidden',
		'bottomAppBarHidden',
		'items',
		'currentPage',
		'leadingAction',
		'trailingActions',
		'headline',
		'iconButtons',
		'fab',
		'navRegionModal',
		'navType'
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
.slx-body {
  flex: auto;
  display: flex;  
  flex-direction: row;
  background: var(--sl-color-primary-100);
}

.slx-split-panel {
  flex: 100%;
  background: var(--sl-color-primary-100);
  margin: 0;
}

.slx-split-panel sl-split-panel::part(divider) {
  background-color: var(--sl-color-primary-100);
}

.slx-pane {
  flex: 100%;
  display: flex;  
  flex-direction: column;
  padding: 16px 0;
  margin: 0;
  text-align: left;
  overflow-x: auto;
  overflow-y: auto;
}

.slx-pane-1 {
  padding-left: 16px;
}

.slx-pane-2 {
  padding-right: 16px;
}

.slx-pane-content {
  border-radius: 16px;
  background: var(--sl-color-primary-200);
}
'
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> globalStyleBottomAppBar [

	<webResource: #css>

	^ '
.slx-footer {
  flex: 0 0 72px;
  background: var(--sl-color-primary-200);
}

.bottomAppBar {
  display: flex;
  flex-flow: row wrap;
  padding: 12px 16px 12px 4px;
}
.bottomAppBar-button {
  height: 48px;
  width: 48px;
  font-size: 24px;
}
.bottomAppBar-fab {
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
.slx-navRegion {
  flex: 0 0 80px;
}

ul.slx-nav-rail {
  list-style: none;
  padding: 0;
  margin: 0;
  background: var(--sl-color-primary-200);
}

.rail-item {
	padding: 12px;
	height: 56px;
	width: 56px;
}

.rail-icon {
	padding: 6px;
	font-size: 24px;
}
'
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> globalStyleSidesheet [

	<webResource: #css>

	^ '
.slx-sidesheet-content {
  border-radius: 16px;
  background: var(--sl-color-primary-200);
}
'
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> globalStyleTopAppBar [

	<webResource: #css>

	^ '
.slx-header {
  border-radius: 16px;
  margin-bottom: 16px;
  flex: 0 0 64px;
  display: flex;  
  flex-direction: column;
  background: var(--sl-color-primary-200);
}
.topAppBar {
  display: flex;
  flex-flow: row wrap;
  padding: 8px 4px 8px 4px;
}
.topAppBar-leadingAction {
  margin-top: 4px;
  height: 48px;
  width: 48px;
  font-size: 24px;
}
.topAppBar-headline {
  margin-top: 4px;
  padding-top: 8px;
  padding-left: 8px;
  height: 48px;
  font-size: 24px;
}
.topAppBar-trailingActions {
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
.slx-nav {
  background: var(--sl-color-primary-200);
}

.smd-navrail-drawer {
  padding: 0;
  margin: 0;
  background: var(--sl-color-primary-200);
}

.slx-sidesheet {
  margin-left: auto;
  max-width: 400px;
  background: var(--sl-color-primary-200);
}
'
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <div style="display: flex; flex-direction: column">
    <div id="layoutRegion" style="flex: 1; display: flex; flex-direction: row">
      <div id="smdNavRegion" class="slx-navRegion">
        <slot name="nav"></slot>
      </div>
      <slot name="slx-body"></slot>
      <aside id="sm3-sidesheet" class="slx-sidesheet">
        <slot name="sidesheet"></slot>
      </aside>
    </div>
    <footer id="sm3-bottomAppBar" class="slx-bottomAppBar">
      <slot name="bottomAppBar"></slot>
    </footer>
  </div>
  <aside>
    <slot name="navModalPane"></slot>
  </div>
</div>
'
]

{ #category : #bottomAppBar }
CpMaterial3LayoutView >> adjustBodyHeight [

	self bodyFind
		styleAt: 'height'
		put: (self bottomAppBarHidden ifTrue: [ '100vh' ] ifFalse: [ 'calc(100vh - 72px)' ]).
]

{ #category : #layout }
CpMaterial3LayoutView >> bodyFind [

	^ CpHtmlElement documentBody firstDescendantMatching: '#sm3-body'
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
			id: 'sm3-body';
			addClass: 'slx-body';
			appendChild: ((CpHtmlElement newWithTag: #div)
				addClass: 'slx-split-panel';
				appendChild: split;
				yourself);
			yourself)
		atSlotNamed: #'slx-body'
]

{ #category : #bottomAppBar }
CpMaterial3LayoutView >> bottomAppBarBuild [
	| element icons |

	icons := self iconButtons.

	element := (CpHtmlElement newWithTag: #div) addClass: 'bottomAppBar'; yourself.
	icons size >= 1 ifTrue: [
		element appendChild: (
			self buildIconButton: icons first class: 'bottomAppBar-button') ].
	icons size >= 2 ifTrue: [
		element appendChild: (
			self buildIconButton: icons second class: 'bottomAppBar-button') ].
	icons size >= 3 ifTrue: [
		element appendChild: (
			self buildIconButton: icons third class: 'bottomAppBar-button') ].

	self fab notNil ifTrue: [
		element appendChild: (
			self buildIconButton: self fab class: 'bottomAppBar-fab') ].

	^ (CpHtmlElement newWithTag: #footer)
		addClass: 'slx-footer';
		appendChild: element;
		yourself

]

{ #category : #bottomAppBar }
CpMaterial3LayoutView >> bottomAppBarDisplay: aBoolean [
	| element |

	element := self bottomAppBarFind.
	element ifNotNil: [
		aBoolean
			ifTrue: [ element styleAt: 'display' put: 'none' ]
			ifFalse: [ element removeStyleAt: 'display' ] ].

]

{ #category : #bottomAppBar }
CpMaterial3LayoutView >> bottomAppBarFind [

	"^ CpHtmlElement documentBody firstDescendantMatching: '#sm3-bottomAppBar'"
	^ self shadowedElementWithId: 'sm3-bottomAppBar'
]

{ #category : #accessing }
CpMaterial3LayoutView >> bottomAppBarHidden [

	^ bottomAppBarHidden
]

{ #category : #accessing }
CpMaterial3LayoutView >> bottomAppBarHidden: anObject [

	bottomAppBarHidden := anObject
]

{ #category : #bottomAppBar }
CpMaterial3LayoutView >> bottomAppBarOff [

	self bottomAppBarHidden: true.
	self setChecked: true domId: '#bottomAppBarHidden'.
	self bottomAppBarDisplay: true.
	self adjustBodyHeight.

]

{ #category : #bottomAppBar }
CpMaterial3LayoutView >> bottomAppBarOn [

	self bottomAppBarHidden: false.
	self setChecked: false domId: '#bottomAppBarHidden'.
	self bottomAppBarDisplay: false.
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
CpMaterial3LayoutView >> buildLayoutRadioGroup [
	| radioGroup |

	radioGroup := SlRadioGroup new
		propertyAt: 'label' put: 'Choose a layout style';
		propertyAt: 'value' put: 2;
		when: SlChangeEvent do: [ self setLayoutStyle: radioGroup value ] for: self;
		yourself.

	radioGroup appendChild: (SlRadioButton new value: 1; textContent: 'Compact'; yourself).
	radioGroup appendChild: (SlRadioButton new value: 2; textContent: 'Medium'; yourself).
	radioGroup appendChild: (SlRadioButton new value: 3; textContent: 'Expanded'; yourself).
	radioGroup appendChild: (SlRadioButton new value: 4; textContent: 'Large'; yourself).
	radioGroup appendChild: (SlRadioButton new value: 5; textContent: 'Extra-large'; yourself).

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
CpMaterial3LayoutView >> buildNavTypeRadioGroup [
	| radioGroup |

	radioGroup := SlRadioGroup new
		propertyAt: 'label' put: 'Choose a navigation type';
		propertyAt: 'value' put: #rail;
		when: SlChangeEvent do: [ self setNavTypeStyle: radioGroup value ] for: self;
		yourself.

	radioGroup appendChild: (SlRadioButton new value: #rail; textContent: 'Rail'; yourself).
	radioGroup appendChild: (SlRadioButton new value: #drawer; textContent: 'Drawer'; yourself).
	radioGroup appendChild: (SlRadioButton new value: #bar; textContent: 'Bar'; beDisabled; yourself).

	^ ((CpHtmlElement newWithTag: #div) appendChild: radioGroup; yourself)
]

{ #category : #'nav - drawer' }
CpMaterial3LayoutView >> buildNavdrawerItem: buttonName methodName: methodName [

	^ (CpHtmlElement newWithTag: #div)
		addClass: 'nav-drawer-item';
		when: CpClickEvent basicPrimary send: methodName to: self;
		appendChild: (
			SlButton new
				bePill;
				addClass: 'nav-drawer-icon';
				labelText: buttonName;
				prefix: (SlIconButton named: buttonName);
				yourself);
		yourself
]

{ #category : #'nav - rail' }
CpMaterial3LayoutView >> buildNavrailItem: buttonName methodName: methodName [

	^ (CpHtmlElement newWithTag: #div)
		addClass: 'rail-item';
		when: CpClickEvent basicPrimary send: methodName to: self;
		appendChild: (
			(SlIconButton named: buttonName)
				addClass: 'rail-icon';
				yourself);
		yourself
]

{ #category : #settings }
CpMaterial3LayoutView >> buildToggleBottomAppBar [

	^ self
		newToggleId: 'bottomAppBarHidden'
		label: 'BottomAppBar hidden'
		do: [
			self bottomAppBarHidden: self bottomAppBarHidden not ].

]

{ #category : #settings }
CpMaterial3LayoutView >> buildToggleNavRegion [

	^ self
		newToggleId: 'navRegionModal'
		label: 'Navigation Region modal'
		do: [ self navRegionModalSet: self navRegionModal not ].

]

{ #category : #settings }
CpMaterial3LayoutView >> buildToggleSidesheet [

	^ self
		newToggleId: 'sidesheetHidden'
		label: 'Sidesheet hidden'
		do: [
			self sidesheetHidden: self sidesheetHidden not.
			self sidesheetDisplay: self sidesheetHidden ].

]

{ #category : #settings }
CpMaterial3LayoutView >> buildToggleTopAppBar [

	^ self
		newToggleId: 'topAppBarHidden'
		label: 'TopAppBar hidden'
		do: [
			self topAppBarHidden: self topAppBarHidden not.
			self topAppBarDisplay: self topAppBarHidden ].

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

	navType := #rail.
	navRegionModal := false.
	pane2Hidden := false.
	sidesheetHidden := false.
	topAppBarHidden := false.
	bottomAppBarHidden := false.

	currentPage := 'Club'.

	items := {
'suit-club' -> #doClub.
'suit-diamond' -> #doDiamond.
'suit-heart' -> #doHeart.
'suit-spade' -> #doSpade
}
]

{ #category : #accessing }
CpMaterial3LayoutView >> items [

	^ items
]

{ #category : #accessing }
CpMaterial3LayoutView >> items: anObject [

	items := anObject
]

{ #category : #layout }
CpMaterial3LayoutView >> layoutRegionFind [

	^ self shadowedElementWithId: 'layoutRegion'
]

{ #category : #layout }
CpMaterial3LayoutView >> layoutSetUp [
	"Invoked by presenter's viewInitialize"

	self navModalPaneSetUp.
	self navSetUp.

	self bodySetUp.
	self setLayoutStyle: 2.

	self sidesheetSetUp.
	self bottomAppBarSetUp.

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

	^ true
		ifTrue: [ self navdrawerBuild ] ifFalse: [ self navrailBuild ]
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

{ #category : #accessing }
CpMaterial3LayoutView >> navRegionModal [

	^ navRegionModal
]

{ #category : #accessing }
CpMaterial3LayoutView >> navRegionModal: anObject [

	navRegionModal := anObject
]

{ #category : #nav }
CpMaterial3LayoutView >> navRegionModalOff [

	self navRegionModal not ifTrue: [
		^ self ].

	self navRegionModal: false.
	self topAppBarMenuDisplay: true.
	self setChecked: false domId: '#navRegionModal'.
	self navSetUp.

]

{ #category : #nav }
CpMaterial3LayoutView >> navRegionModalOn [

	self navRegionModal ifTrue: [
		^ self ].

	self navRegionModal: true.
	self topAppBarMenuDisplay: false.
	self setChecked: true domId: '#navRegionModal'.
	self navSetUp.

]

{ #category : #settings }
CpMaterial3LayoutView >> navRegionModalSet: aBoolean [

	aBoolean ifTrue: [ self navRegionModalOn ] ifFalse: [ self navRegionModalOff ]
]

{ #category : #nav }
CpMaterial3LayoutView >> navSetUp [

	self navRegionModal
		ifTrue: [ | el |
			self removeChildrenAtSlotNamed: 'nav'.
			el := self navModalPaneContentFind.
			el ifNotNil: [
				el replaceAllChildrenWith: self navContentBuild ]]
		ifFalse: [ 
			self
				replaceAllChildrenWith: self navContentBuild
				atSlotNamed: 'nav' ]
]

{ #category : #accessing }
CpMaterial3LayoutView >> navType [

	^ navType
]

{ #category : #accessing }
CpMaterial3LayoutView >> navType: anObject [

	navType := anObject
]

{ #category : #accessing }
CpMaterial3LayoutView >> navTypeBeBar [

	self navType: #bar
]

{ #category : #accessing }
CpMaterial3LayoutView >> navTypeBeDrawer [

	self navType: #drawer
]

{ #category : #accessing }
CpMaterial3LayoutView >> navTypeBeRail [

	self navType: #rail
]

{ #category : #accessing }
CpMaterial3LayoutView >> navTypeIsBar [

	^ self navType = #bar
]

{ #category : #accessing }
CpMaterial3LayoutView >> navTypeIsDrawer [

	^ self navType = #drawer
]

{ #category : #accessing }
CpMaterial3LayoutView >> navTypeIsRail [

	^ self navType = #rail
]

{ #category : #'nav - drawer' }
CpMaterial3LayoutView >> navdrawerBuild [
	| element drawer |

	drawer := self navModalPaneFind.

	element := CpHtmlElement newWithTag: #ul.
	element addClass: 'slx-nav-rail'.
	items ifNotNil: [
		items do: [ :eachItem | | navItem |
			navItem := self buildNavdrawerItem: eachItem key methodName: eachItem value.
			navItem when: CpClickEvent basicPrimary send: #hide to: drawer.
			element appendChild: navItem ] ].

	^ (CpHtmlElement newWithTag: #nav)
		addClass: 'slx-nav';
		appendChild: element;
		yourself
]

{ #category : #'nav - rail' }
CpMaterial3LayoutView >> navrailBuild [
	| element drawer |

	drawer := self navModalPaneFind.

	element := CpHtmlElement newWithTag: #ul.
	element addClass: 'slx-nav-rail'.
	items ifNotNil: [
		items do: [ :eachItem | | navItem |
			navItem := self buildNavrailItem: eachItem key methodName: eachItem value.
			navItem when: CpClickEvent basicPrimary send: #hide to: drawer.
			element appendChild: navItem ] ].

	^ (CpHtmlElement newWithTag: #nav)
		addClass: 'slx-nav';
		appendChild: element;
		yourself
]

{ #category : #settings }
CpMaterial3LayoutView >> newToggleId: id label: label do: aBlock [
	| toggle |

	toggle := SlSwitch new
		id: id;
		label: label;
		when: SlChangeEvent do: aBlock for: self;
		yourself.

	^ (CpHtmlElement newWithTag: #div) appendChild: toggle; yourself.

]

{ #category : #layout }
CpMaterial3LayoutView >> pane1Build [
	| element |

	element := (CpHtmlElement newWithTag: #div)
		addClass: 'slx-pane';
		addClass: 'slx-pane-1';
		yourself.

	self topAppBarHidden not ifTrue: [
		element appendChild: self topAppBarBuild ].

	element
		appendChild: ((CpHtmlElement newWithTag: #div)
			id: 'pane1-content';
			addClass: 'slx-pane-content';
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

{ #category : #settings }
CpMaterial3LayoutView >> pane2build [
	| element paneContent |

	element := (CpHtmlElement newWithTag: #div)
		addClass: 'slx-pane';
		addClass: 'slx-pane-2';
		appendChild: (paneContent := (CpHtmlElement newWithTag: #div)
			addClass: 'slx-pane-content';
			appendChild: ('Layout Settings' inHtmlTag: #h3);
			yourself);
		yourself.

	paneContent appendChild: self buildLayoutRadioGroup.
	paneContent appendChild: self buildNavTypeRadioGroup.
	paneContent appendChild: self buildToggleNavRegion.
	paneContent appendChild: self buildToggleTopAppBar.
	paneContent appendChild: self buildToggleBottomAppBar.
	paneContent appendChild: self buildToggleSidesheet.

	^ element
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

	element := CpHtmlElement documentBody firstDescendantMatching: '#pane1-content'.
	element notNil ifTrue: [
		element replaceAllChildrenWith: (currentPage inHtmlTag: #p) ]

]

{ #category : #settings }
CpMaterial3LayoutView >> setLayoutStyle: aLayoutType [

	aLayoutType = 1 ifTrue: [ self navRegionModalOn; bottomAppBarOn; sidesheetOff ].
	aLayoutType = 2 ifTrue: [ self navRegionModalOn; bottomAppBarOn; sidesheetOff ].
	aLayoutType = 3 ifTrue: [ self navRegionModalOff; bottomAppBarOff; sidesheetOff ].
	aLayoutType = 4 ifTrue: [ self navRegionModalOff; bottomAppBarOff; sidesheetOff ].
	aLayoutType = 5 ifTrue: [ self navRegionModalOff; bottomAppBarOff; sidesheetOn ].

]

{ #category : #settings }
CpMaterial3LayoutView >> setNavTypeStyle: aNavType [

	self navType: aNavType.

	self navModalPaneFind
		customPropertyAt: 'size'
		put: self navModalPaneWidth
]

{ #category : #sidesheet }
CpMaterial3LayoutView >> sidesheetBuild [

	^ (CpHtmlElement newWithTag: #div)
		addClass: 'slx-sidesheet-content';
		appendChild: ('Lorem ipsum...' inHtmlTag: #span);
		yourself

]

{ #category : #sidesheet }
CpMaterial3LayoutView >> sidesheetDisplay: aBoolean [
	| element |

	element := self sidesheetFind.
	#element ifNotNil: [
		aBoolean
			ifTrue: [ element styleAt: 'display' put: 'none' ]
			ifFalse: [ element removeStyleAt: 'display' ] ].

]

{ #category : #sidesheet }
CpMaterial3LayoutView >> sidesheetFind [

	"^ CpHtmlElement documentBody firstDescendantMatching: '#sm3-sidesheet'"
	^ self shadowedElementWithId: 'sm3-sidesheet'
]

{ #category : #accessing }
CpMaterial3LayoutView >> sidesheetHidden [

	^ sidesheetHidden
]

{ #category : #accessing }
CpMaterial3LayoutView >> sidesheetHidden: anObject [

	sidesheetHidden := anObject
]

{ #category : #sidesheet }
CpMaterial3LayoutView >> sidesheetOff [

	self sidesheetHidden: true.
	self setChecked: true domId: '#sidesheetHidden'.
	self sidesheetDisplay: self sidesheetHidden.

]

{ #category : #sidesheet }
CpMaterial3LayoutView >> sidesheetOn [

	self sidesheetHidden: false.
	self setChecked: false domId: '#sidesheetHidden'.
	self sidesheetDisplay: self sidesheetHidden.

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
		id: 'sm3-topAppBar';
		addClass: 'slx-header';
		appendChild: ((CpHtmlElement newWithTag: #div)
			addClass: 'topAppBar';
			appendChild: ((CpHtmlElement newWithTag: #div)
				addClass: 'topAppBar-leadingAction';
				appendChild: self buildLeadingAction;
				yourself);
			appendChild: ((CpHtmlElement newWithTag: #div)
				addClass: 'topAppBar-headline';
				appendChild: (self headline inHtmlTag: #span);
				yourself);
			appendChild: ((CpHtmlElement newWithTag: #div)
				addClass: 'topAppBar-trailingActions';
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
			ifTrue: [ element styleAt: 'display' put: 'none' ]
			ifFalse: [ element removeStyleAt: 'display' ] ].

]

{ #category : #topAppBar }
CpMaterial3LayoutView >> topAppBarFind [

	^ CpHtmlElement documentBody firstDescendantMatching: '#sm3-topAppBar'
]

{ #category : #accessing }
CpMaterial3LayoutView >> topAppBarHidden [

	^ topAppBarHidden
]

{ #category : #accessing }
CpMaterial3LayoutView >> topAppBarHidden: anObject [

	topAppBarHidden := anObject
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

	^ CpHtmlElement documentBody firstDescendantMatching: '.topAppBar-leadingAction'
]

{ #category : #accessing }
CpMaterial3LayoutView >> trailingActions [

	^ trailingActions
]

{ #category : #accessing }
CpMaterial3LayoutView >> trailingActions: anObject [

	trailingActions := anObject
]
