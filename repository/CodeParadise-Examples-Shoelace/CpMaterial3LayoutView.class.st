Class {
	#name : #CpMaterial3LayoutView,
	#superclass : #CpView,
	#instVars : [
		'pane2Hidden',
		'sidesheetHidden',
		'navRailHidden',
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

	^ '
.rail-item {
	margin: 12px;
	height: 56px;
	width: 56px;
}

.rail-icon {
	font-size: 24px;
}
'
, self globalStyleBody
, self globalStyleTopAppBar
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
  width: 100%;
  background: var(--sl-color-primary-100);
  margin: 16px 0;
}

.slx-split-panel sl-split-panel::part(divider) {
  background-color: var(--sl-color-primary-100);
}

.slx-pane {
  flex: 100%;
  display: flex;  
  flex-direction: column;
  padding: 0;
  margin: 0;
  text-align: left;
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

	^ self styleLayout
		, self styleNav
		, self styleSidesheet
		, self styleBottomAppBar
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> styleBottomAppBar [

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
CpMaterial3LayoutView class >> styleLayout [

	<webResource: #css>

	^ '
.slx-layout {
  flex: 1;
  height: calc(100vh - 72px);
  padding: 0;
  margin: 0;
  display: flex;  
  flex-flow: row wrap;
}
'
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> styleNav [

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
}
'
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> styleSidesheet [

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
CpMaterial3LayoutView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <div class="slx-layout">',
    self templateNav,
    '<slot name="slx-body"></slot>',
    self templateSidesheet, '
  </div>',
  self templateFooter, '
</div>'
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> templateFooter [

	<webResource: #html>

	^ '
<footer class="slx-footer">
  <slot name="bottomAppBar"></slot>
  <div class="bottomAppBar">
    <div class="bottomAppBar-button"><slot name="icon1"></slot></div>
    <div class="bottomAppBar-button"><slot name="icon2"></slot></div>
    <div class="bottomAppBar-button"><slot name="icon3"></slot></div>
    <div class="bottomAppBar-button"><slot name="icon4"></slot></div>
    <div class="bottomAppBar-fab"><slot name="fab"></slot></div>
  </div>
</footer>
'
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> templateNav [

	<webResource: #html>

	^ '
<nav class="slx-nav">
  <ul class="slx-nav-rail">
    <slot name="nav"></slot>
  </ul>
  <slot name="left-drawer"></slot>
</nav>
'
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> templateSidesheet [

	<webResource: #html>

	^ '
<aside class="slx-sidesheet">
  <div class="slx-sidesheet-content">
  <p>SideSheetSideSheet</p>
  <slot name="sidesheet"></slot>
  </div>
</aside>
'
]

{ #category : #accessing }
CpMaterial3LayoutView >> bottomAppBarHidden [

	^ bottomAppBarHidden
]

{ #category : #accessing }
CpMaterial3LayoutView >> bottomAppBarHidden: anObject [

	bottomAppBarHidden := anObject
]

{ #category : #'rendering - topAppBar' }
CpMaterial3LayoutView >> buildLeadingAction [
	| drawer |

	drawer := self findLeftDrawer.

	^ (SlIconButton named: self leadingAction)
		when: CpClickEvent basicPrimary send: #show to: drawer;
		yourself

]

{ #category : #'rendering - body' }
CpMaterial3LayoutView >> buildPane1 [
	| element |

	element := (CpHtmlElement newWithTag: #div)
		addClass: 'slx-pane';
		addClass: 'slx-pane-1';
		appendChild: self buildTopAppBar;
		appendChild: ((CpHtmlElement newWithTag: #div)
			addClass: 'slx-pane-content';
			appendChild: (self currentPage inHtmlTag: #p);
			yourself);
		yourself.

	^ element
]

{ #category : #'rendering - body' }
CpMaterial3LayoutView >> buildPane2 [
	| element |

	element := (CpHtmlElement newWithTag: #div)
		addClass: 'slx-pane';
		addClass: 'slx-pane-2';
		appendChild: ((CpHtmlElement newWithTag: #div)
			addClass: 'slx-pane-content';
			appendChild: ('Pane2...' inHtmlTag: #p);
			yourself);
		yourself.

	^ element
]

{ #category : #'rendering - topAppBar' }
CpMaterial3LayoutView >> buildTopAppBar [
	| trailing |

	trailing := self trailingActions.

	^ (CpHtmlElement newWithTag: #header)
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

{ #category : #'rendering - page' }
CpMaterial3LayoutView >> doClub [

	self setCurrentPage: 'Club'
]

{ #category : #'rendering - page' }
CpMaterial3LayoutView >> doDiamond [

	self setCurrentPage: 'Diamond'.

]

{ #category : #'rendering - page' }
CpMaterial3LayoutView >> doHeart [

	self setCurrentPage: 'Heart'
]

{ #category : #'rendering - page' }
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
CpMaterial3LayoutView >> findLeftDrawer [

	"^ CpHtmlElement documentBody firstDescendantMatching: '#leftDrawer'"
	^ CpHtmlElement documentBody firstDescendantMatching: '.left-drawer'
	"^ SlDrawer first"
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

	pane2Hidden := false.
	sidesheetHidden := false.
	navRailHidden := false.
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

{ #category : #'rendering - body' }
CpMaterial3LayoutView >> renderBody [
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
			addClass: 'slx-body';
			appendChild: ((CpHtmlElement newWithTag: #div)
				addClass: 'slx-split-panel';
				appendChild: split;
				yourself);
			yourself)
		atSlotNamed: #'slx-body'
]

{ #category : #'rendering - bottomAppBar' }
CpMaterial3LayoutView >> renderBottomAppBar [

	"self model isActive" true ifTrue: [
		self renderIcons.
		self renderFAB ]
]

{ #category : #'rendering - bottomAppBar' }
CpMaterial3LayoutView >> renderFAB [

	self renderFAB: self fab
]

{ #category : #'rendering - bottomAppBar' }
CpMaterial3LayoutView >> renderFAB: aString [

	self renderIcon: aString at: #fab
]

{ #category : #'rendering - bottomAppBar' }
CpMaterial3LayoutView >> renderIcon1: aString [

	self renderIcon: aString at: #icon1
]

{ #category : #'rendering - bottomAppBar' }
CpMaterial3LayoutView >> renderIcon2: aString [

	self renderIcon: aString at: #icon2
]

{ #category : #'rendering - bottomAppBar' }
CpMaterial3LayoutView >> renderIcon3: aString [

	self renderIcon: aString at: #icon3
]

{ #category : #'rendering - bottomAppBar' }
CpMaterial3LayoutView >> renderIcon4: aString [

	self renderIcon: aString at: #icon4
]

{ #category : #'rendering - bottomAppBar' }
CpMaterial3LayoutView >> renderIcon: aString at: slotName [

	aString
		ifNotNil: [
			self
				replaceAllChildrenWith: (SlIconButton named: aString)
				atSlotNamed: slotName ]
		ifNil: [ self removeChildrenAtSlotNamed: slotName ]
]

{ #category : #'rendering - bottomAppBar' }
CpMaterial3LayoutView >> renderIcons [
	| icons |

	icons := self iconButtons.
	icons size >= 1 ifTrue: [ self renderIcon1: icons first ].
	icons size >= 2 ifTrue: [ self renderIcon2: icons second ].
	icons size >= 3 ifTrue: [ self renderIcon3: icons third ].
	icons size >= 4 ifTrue: [ self renderIcon4: icons fourth ].

]

{ #category : #rendering }
CpMaterial3LayoutView >> renderLayout [

	self
		renderLeftDrawer;
		renderNav;
		renderBottomAppBar;
		renderBody.

]

{ #category : #rendering }
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

{ #category : #rendering }
CpMaterial3LayoutView >> renderNav [

	items ifNotNil: [ | element drawer |
		drawer := self findLeftDrawer.
		element := CpHtmlElement newWithTag: #div.
		element appendChild: (
			(CpHtmlElement newWithTag: #div)
				addClass: 'rail-item';
				appendChild: (SlIconButton named: 'list');
					addClass: 'rail-icon';
					"when: CpClickEvent basicPrimary send: #leftDrawerOpen to: self;"
					when: CpClickEvent basicPrimary send: #show to: drawer;
					yourself);
				yourself.
		items do: [ :eachItem |
			element appendChild: (
				(CpHtmlElement newWithTag: #div)
					addClass: 'rail-item';
					when: CpClickEvent basicPrimary send: eachItem value to: self;
					appendChild: (
						(SlIconButton named: eachItem key)
							addClass: 'rail-icon';
							yourself);
					yourself) ].
		self replaceAllChildrenWith: element atSlotNamed: #nav ]
]

{ #category : #'rendering - page' }
CpMaterial3LayoutView >> setCurrentPage: aString [

	currentPage := aString.
	self renderLayout.

]

{ #category : #accessing }
CpMaterial3LayoutView >> sidesheetHidden [

	^ sidesheetHidden
]

{ #category : #accessing }
CpMaterial3LayoutView >> sidesheetHidden: anObject [

	sidesheetHidden := anObject
]

{ #category : #accessing }
CpMaterial3LayoutView >> trailingActions [

	^ trailingActions
]

{ #category : #accessing }
CpMaterial3LayoutView >> trailingActions: anObject [

	trailingActions := anObject
]
