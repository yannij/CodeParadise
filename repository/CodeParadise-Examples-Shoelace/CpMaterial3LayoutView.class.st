Class {
	#name : #CpMaterial3LayoutView,
	#superclass : #CpView,
	#instVars : [
		'pane2Hidden',
		'sidesheetHidden',
		'navRailHidden',
		'topAppBarHidden',
		'bottomAppBarHidden',
		'items',
		'currentPage',
		'leadingAction',
		'trailingActions',
		'headline',
		'iconButtons',
		'fab'
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
.slx-nav {
  padding: 0;
  margin: 0;
  flex: 0 0 80px;
  background: var(--sl-color-primary-200);
}

ul.slx-nav-rail {
  list-style: none;
  padding: 0;
  margin: 0;
  background: var(--sl-color-primary-200);
}

.rail-item {
	margin: 12px;
	height: 56px;
	width: 56px;
}

.rail-icon {
	font-size: 24px;
}
'
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> globalStyleSidesheet [

	<webResource: #css>

	^ '
.slx-sidesheet {
  margin-left: auto;
  max-width: 400px;
  background: var(--sl-color-primary-200);
}

.slx-sidesheet-content {
  border-radius: 16px;
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

	^ ''
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <div style="display: flex; flex-direction: column">
    <div id="layoutRegion" style="flex: 1; display: flex; flex-direction: row">
      <slot name="nav"></slot>
      <slot name="slx-body"></slot>
      <slot name="slx-sidesheet"></slot>
    </div>
    <slot name="bottomAppBar"></slot>
  </div>
  <slot name="left-drawer"></slot>
</div>
'
]

{ #category : #'rendering - pane2' }
CpMaterial3LayoutView >> appendBottomAppBarToggle: paneContent [

	self
		appendToggle: paneContent
		label: 'BottomAppBar hidden'
		id: 'bottomAppBarHidden'
		do: [
			self bottomAppBarHidden: self bottomAppBarHidden not.
			self refresh ].

]

{ #category : #'rendering - pane2' }
CpMaterial3LayoutView >> appendLayoutRadioGroup: paneContent [
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

	paneContent appendChild: ((CpHtmlElement newWithTag: #div) appendChild: radioGroup; yourself).

]

{ #category : #'rendering - nav' }
CpMaterial3LayoutView >> appendMenuItem: element [
	| drawer |

	drawer := self findLeftDrawer.
	element appendChild: (
		(CpHtmlElement newWithTag: #div)
			addClass: 'rail-item';
			appendChild: (SlIconButton named: 'list');
				addClass: 'rail-icon';
				when: CpClickEvent basicPrimary send: #show to: drawer;
				yourself).

]

{ #category : #'rendering - nav' }
CpMaterial3LayoutView >> appendNavItem: element buttonName: buttonName methodName: methodName [

	element appendChild: (
		(CpHtmlElement newWithTag: #div)
			addClass: 'rail-item';
			when: CpClickEvent basicPrimary send: methodName to: self;
			appendChild: (
				(SlIconButton named: buttonName)
					addClass: 'rail-icon';
					yourself);
			yourself)
]

{ #category : #'rendering - pane2' }
CpMaterial3LayoutView >> appendSidesheetToggle: paneContent [

	self
		appendToggle: paneContent
		label: 'Sidesheet hidden'
		id: 'sidesheetHidden'
		do: [
			self sidesheetHidden: self sidesheetHidden not.
			self refresh ].

]

{ #category : #'rendering - pane2' }
CpMaterial3LayoutView >> appendToggle: paneContent label: label id: id do: aBlock [
	| toggle |

	toggle := SlSwitch new
		id: id;
		label: label;
		when: SlChangeEvent do: aBlock for: self;
		yourself.

	paneContent appendChild: ((CpHtmlElement newWithTag: #div) appendChild: toggle; yourself).

]

{ #category : #'rendering - pane2' }
CpMaterial3LayoutView >> appendTopAppBarToggle: paneContent [

	self
		appendToggle: paneContent
		label: 'TopAppBar hidden'
		id: 'topAppBarHidden'
		do: [
			self topAppBarHidden: self topAppBarHidden not.
			self setTopAppBarDisplay: self topAppBarHidden.
			self refresh ].

]

{ #category : #accessing }
CpMaterial3LayoutView >> bottomAppBarHidden [

	^ bottomAppBarHidden
]

{ #category : #accessing }
CpMaterial3LayoutView >> bottomAppBarHidden: anObject [

	bottomAppBarHidden := anObject
]

{ #category : #'rendering - pane2' }
CpMaterial3LayoutView >> bottomAppBarOff [

	self bottomAppBarHidden: true.
	self setChecked: true domId: '#bottomAppBarHidden'.

]

{ #category : #'rendering - pane2' }
CpMaterial3LayoutView >> bottomAppBarOn [

	self bottomAppBarHidden: false.
	self setChecked: false domId: '#bottomAppBarHidden'.

]

{ #category : #'rendering - bottomAppBar' }
CpMaterial3LayoutView >> buildBottomAppBar [
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

{ #category : #'rendering - bottomAppBar' }
CpMaterial3LayoutView >> buildIconButton: iconName class: cssClass [

	^ (CpHtmlElement newWithTag: #div)
		addClass: cssClass;
		appendChild: (SlIconButton named: iconName);
		yourself
]

{ #category : #'rendering - topAppBar' }
CpMaterial3LayoutView >> buildLeadingAction [
	| drawer |

	drawer := self findLeftDrawer.

	^ (SlIconButton named: self leadingAction)
		when: CpClickEvent basicPrimary send: #show to: drawer;
		yourself

]

{ #category : #'rendering - nav' }
CpMaterial3LayoutView >> buildNav [
	| element |

	element := CpHtmlElement newWithTag: #ul.
	element addClass: 'slx-nav-rail'.
	self appendMenuItem: element.
	items ifNotNil: [
		items do: [ :eachItem |
			self appendNavItem: element buttonName: eachItem key methodName: eachItem value ] ].

	^ (CpHtmlElement newWithTag: #nav)
		addClass: 'slx-nav';
		appendChild: element;
		yourself
]

{ #category : #'rendering - pane1' }
CpMaterial3LayoutView >> buildPane1 [
	| element |

	element := (CpHtmlElement newWithTag: #div)
		addClass: 'slx-pane';
		addClass: 'slx-pane-1';
		yourself.

	self topAppBarHidden not ifTrue: [
		element appendChild: self buildTopAppBar ].

	element
		appendChild: ((CpHtmlElement newWithTag: #div)
			id: 'pane1-content';
			addClass: 'slx-pane-content';
			appendChild: (self currentPage inHtmlTag: #p);
			yourself);
		yourself.

	^ element
]

{ #category : #'rendering - pane2' }
CpMaterial3LayoutView >> buildPane2 [
	| element paneContent |

	element := (CpHtmlElement newWithTag: #div)
		addClass: 'slx-pane';
		addClass: 'slx-pane-2';
		appendChild: (paneContent := (CpHtmlElement newWithTag: #div)
			addClass: 'slx-pane-content';
			appendChild: ('Layout Settings' inHtmlTag: #h3);
			yourself);
		yourself.

	self appendLayoutRadioGroup: paneContent.
	self appendTopAppBarToggle: paneContent.
	self appendBottomAppBarToggle: paneContent.
	self appendSidesheetToggle: paneContent.

	^ element
]

{ #category : #'rendering - sidesheet' }
CpMaterial3LayoutView >> buildSidesheet [
	| element |

	element := (CpHtmlElement newWithTag: #aside) addClass: 'slx-sidesheet'; yourself.

	element appendChild: ((CpHtmlElement newWithTag: #div)
			addClass: 'slx-sidesheet-content';
			appendChild: ('Lorem ipsum...' inHtmlTag: #span);
			yourself).

	^ element

]

{ #category : #'rendering - topAppBar' }
CpMaterial3LayoutView >> buildTopAppBar [
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

{ #category : #accessing }
CpMaterial3LayoutView >> currentPage [

	^ currentPage
]

{ #category : #accessing }
CpMaterial3LayoutView >> currentPage: anObject [

	currentPage := anObject
]

{ #category : #'rendering - pane1' }
CpMaterial3LayoutView >> doClub [

	self setCurrentPage: 'Club'
]

{ #category : #'rendering - pane1' }
CpMaterial3LayoutView >> doDiamond [

	self setCurrentPage: 'Diamond'.

]

{ #category : #'rendering - pane1' }
CpMaterial3LayoutView >> doHeart [

	self setCurrentPage: 'Heart'
]

{ #category : #'rendering - pane1' }
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

{ #category : #rendering }
CpMaterial3LayoutView >> findBody [

	^ CpHtmlElement documentBody firstDescendantMatching: '#sm3-body'
]

{ #category : #rendering }
CpMaterial3LayoutView >> findLayoutRegion [

	^ self shadowedElementWithId: 'layoutRegion'
]

{ #category : #'rendering - nav' }
CpMaterial3LayoutView >> findLeftDrawer [

	"^ CpHtmlElement documentBody firstDescendantMatching: '#leftDrawer'"
	^ CpHtmlElement documentBody firstDescendantMatching: '.left-drawer'
	"^ SlDrawer first"
]

{ #category : #'rendering - topAppBar' }
CpMaterial3LayoutView >> findTopAppBar [

	^ CpHtmlElement documentBody firstDescendantMatching: '#sm3-topAppBar'
]

{ #category : #accessing }
CpMaterial3LayoutView >> headline [

	^ headline
]

{ #category : #accessing }
CpMaterial3LayoutView >> headline: anObject [

	headline := anObject
]

{ #category : #'rendering - topAppBar' }
CpMaterial3LayoutView >> hideTopAppBar [

	self findTopAppBar ifNotNil: [
		 ].

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

	pane2Hidden := false.
	sidesheetHidden := false.
	navRailHidden := false.
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

{ #category : #accessing }
CpMaterial3LayoutView >> leadingAction [

	^ leadingAction
]

{ #category : #accessing }
CpMaterial3LayoutView >> leadingAction: anObject [

	leadingAction := anObject
]

{ #category : #accessing }
CpMaterial3LayoutView >> navRailHidden [

	^ navRailHidden
]

{ #category : #accessing }
CpMaterial3LayoutView >> navRailHidden: anObject [

	navRailHidden := anObject
]

{ #category : #accessing }
CpMaterial3LayoutView >> pane2Hidden [

	^ pane2Hidden
]

{ #category : #accessing }
CpMaterial3LayoutView >> pane2Hidden: anObject [

	pane2Hidden := anObject
]

{ #category : #'rendering - pane2' }
CpMaterial3LayoutView >> refresh [

	self renderLayout.

]

{ #category : #rendering }
CpMaterial3LayoutView >> renderBody [
	| element |

	element := self findBody.
	element ifNil: [
		self setUpBody.
		self setLayoutStyle: 2 ].

	self findBody
		styleAt: 'height'
		put: (self bottomAppBarHidden ifTrue: [ '100vh' ] ifFalse: [ 'calc(100vh - 72px)' ]).

]

{ #category : #'rendering - bottomAppBar' }
CpMaterial3LayoutView >> renderBottomAppBar [

	self bottomAppBarHidden
		ifTrue: [
			self removeChildrenAtSlotNamed: 'bottomAppBar' ]
		ifFalse: [
			self
				replaceAllChildrenWith: self buildBottomAppBar
				atSlotNamed: 'bottomAppBar' ]
]

{ #category : #rendering }
CpMaterial3LayoutView >> renderLayout [

	self
		renderLeftDrawer;
		renderNav;
		renderBottomAppBar;
		renderSidesheet;
		renderBody.

]

{ #category : #'rendering - nav' }
CpMaterial3LayoutView >> renderLeftDrawer [
	| drawer |

	drawer := self findLeftDrawer.
	drawer ifNotNil: [
		^ self ].

	drawer := SlDrawer new
		id: 'leftDrawer';
		labelText: 'Left Drawer';
		addClass: 'left-drawer';
		placement: 'start';
		contentText: 'Lorem ipsum...';
		yourself.
	
	drawer footer: (
		(SlButton label: 'Close')
			when: CpClickEvent basicPrimary send: #hide to: drawer;
			yourself).

	self replaceAllChildrenWith: drawer atSlotNamed: #'left-drawer'

]

{ #category : #'rendering - nav' }
CpMaterial3LayoutView >> renderNav [

	self replaceAllChildrenWith: self buildNav atSlotNamed: #nav
]

{ #category : #'rendering - sidesheet' }
CpMaterial3LayoutView >> renderSidesheet [

	self sidesheetHidden
		ifTrue: [
			self removeChildrenAtSlotNamed: 'slx-sidesheet']
		ifFalse: [ 
			self
				replaceAllChildrenWith: self buildSidesheet
				atSlotNamed: 'slx-sidesheet' ]
]

{ #category : #'rendering - pane2' }
CpMaterial3LayoutView >> setChecked: aBoolean domId: id [
	| el |

	el := CpHtmlElement documentBody firstDescendantMatching: id.
	el ifNotNil: [
		el checked: aBoolean ]
]

{ #category : #'rendering - pane1' }
CpMaterial3LayoutView >> setCurrentPage: aString [

	currentPage := aString.
	self updatePane1Content.

]

{ #category : #'rendering - pane2' }
CpMaterial3LayoutView >> setLayoutStyle: aLayoutType [

	aLayoutType = 1 ifTrue: [ self sidesheetOff; bottomAppBarOn ].
	aLayoutType = 2 ifTrue: [ self sidesheetOff ; bottomAppBarOff ].
	aLayoutType = 3 ifTrue: [ self sidesheetOff ; bottomAppBarOff ].
	aLayoutType = 4 ifTrue: [ self sidesheetOff ; bottomAppBarOff ].
	aLayoutType = 5 ifTrue: [ self sidesheetOn ; bottomAppBarOff ].

	self refresh.

]

{ #category : #'rendering - topAppBar' }
CpMaterial3LayoutView >> setTopAppBarDisplay: aBoolean [
	| element |

	element := self findTopAppBar.
	element ifNotNil: [
		aBoolean
			ifTrue: [ element styleAt: 'display' put: 'none' ]
			ifFalse: [ element removeStyleAt: 'display' ] ].

]

{ #category : #rendering }
CpMaterial3LayoutView >> setUpBody [
	| split |

	split := SlSplitPanel new
		customPropertyAt: 'divider-width' put: '24px';
		"propertyAt: 'primary' put: 'start';"
		customPropertyAt: 'min' put: '400px';
		"customPropertyAt: 'max' put: 'calc(100% - 150px)';"
		replaceAllChildrenWith: (SlIcon named: 'grip-vertical') atSlotNamed: #'divider';
		yourself.

	split replaceAllChildrenWith: self buildPane1 atSlotNamed: #'start'.

	self pane2Hidden
		ifTrue: [ split removeChildrenAtSlotNamed: #'end' ]
		ifFalse: [ split replaceAllChildrenWith: self buildPane2 atSlotNamed: #'end' ].

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

{ #category : #accessing }
CpMaterial3LayoutView >> sidesheetHidden [

	^ sidesheetHidden
]

{ #category : #accessing }
CpMaterial3LayoutView >> sidesheetHidden: anObject [

	sidesheetHidden := anObject
]

{ #category : #'rendering - pane2' }
CpMaterial3LayoutView >> sidesheetOff [

	self sidesheetHidden: true.
	self setChecked: true domId: '#sidesheetHidden'.

]

{ #category : #'rendering - pane2' }
CpMaterial3LayoutView >> sidesheetOn [

	self sidesheetHidden: false.
	self setChecked: false domId: '#sidesheetHidden'.

]

{ #category : #accessing }
CpMaterial3LayoutView >> topAppBarHidden [

	^ topAppBarHidden
]

{ #category : #accessing }
CpMaterial3LayoutView >> topAppBarHidden: anObject [

	topAppBarHidden := anObject
]

{ #category : #accessing }
CpMaterial3LayoutView >> trailingActions [

	^ trailingActions
]

{ #category : #accessing }
CpMaterial3LayoutView >> trailingActions: anObject [

	trailingActions := anObject
]

{ #category : #'rendering - pane1' }
CpMaterial3LayoutView >> updatePane1Content [
	| element |

	element := CpHtmlElement documentBody firstDescendantMatching: '#pane1-content'.
	element notNil ifTrue: [
		element replaceAllChildrenWith: (self currentPage inHtmlTag: #p) ]
]
