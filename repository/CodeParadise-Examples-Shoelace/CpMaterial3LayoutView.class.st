Class {
	#name : #CpMaterial3LayoutView,
	#superclass : #CpView,
	#instVars : [
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
CpMaterial3LayoutView class >> style [

	<webResource: #css>

	^ self styleLayout, self styleTopAppBar, self styleBottomAppBar
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> styleBottomAppBar [

	<webResource: #css>

	^ '
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

.slx-nav {
  padding: 0;
  margin: 0;
  flex: 0 0 80px;
  background: var(--sl-color-primary-100);
}

ul.slx-nav-rail {
  list-style: none;
  padding: 0;
  margin: 0;
}

.slx-body {
  padding: 16px;
  margin: 0;
  flex: auto;
  display: flex;  
  flex-direction: row;
  background: var(--sl-color-primary-100);
}

.slx-pane {
  flex: 100%;
  display: flex;  
  flex-direction: column;
  padding: 0;
  margin: 0;
  text-align: left;
}

.slx-header {
  border-radius: 16px;
  margin-bottom: 16px;
  flex: 0 0 64px;
  display: flex;  
  flex-direction: column;
  background: var(--sl-color-primary-200);
}

.slx-pane-content {
  border-radius: 16px;
  background: var(--sl-color-primary-200);
}

.slx-footer {
  flex: 0 0 72px;
  background: var(--sl-color-primary-200);
}

.slx-sidesheet {
  margin-left: auto;
  max-width: 400px;
  padding-left: 16px;
}

.slx-sidesheet-content {
  border-radius: 16px;
  background: var(--sl-color-primary-200);
}
'
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> styleTopAppBar [

	<webResource: #css>

	^ '
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
CpMaterial3LayoutView class >> template [

	<webResource: #html>

	^ '
<div id="container">',
	self templateLayout, '
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
CpMaterial3LayoutView class >> templateHeader [

	<webResource: #html>

	^ '
<header class="slx-header">
  <div class="topAppBar">
    <div class="topAppBar-leadingAction"><slot name="leadingAction"></slot></div>
    <div class="topAppBar-headline"><slot name="headline"></slot></div>
    <div class="topAppBar-trailingActions">
      <slot name="trailingIcon1"></slot>
      <slot name="trailingIcon2"></slot>
      <slot name="trailingIcon3"></slot>
    </div>
  </div>
</header>
'
]

{ #category : #'web resources' }
CpMaterial3LayoutView class >> templateLayout [

	<webResource: #html>

	^ '
<div class="slx-layout">',
  self templateNav, '
  <main class="slx-body">
    <div class="slx-pane">',
      self templateHeader, '
      <div class="slx-pane-content">
        <slot name="slx-pane-content"></slot>
      </div>
    </div>
    <div class="slx-pane">
      <div class="slx-pane-content">
        <slot name="slx-pane-content">Pane2 content</slot>
      </div>
    </div>',
    self templateSidesheet, '
  </main>
</div>',
self templateFooter

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
  SideSheetSideSheet
  <slot name="sidesheet"></slot>
  </div>
</aside>
'
]

{ #category : #accessing }
CpMaterial3LayoutView >> currentPage [

	^ currentPage
]

{ #category : #accessing }
CpMaterial3LayoutView >> currentPage: anObject [

	currentPage := anObject
]

{ #category : #rendering }
CpMaterial3LayoutView >> doClub [

	self setMainPage: 'Club'
]

{ #category : #rendering }
CpMaterial3LayoutView >> doDiamond [

	self setMainPage: 'Diamond'.

]

{ #category : #rendering }
CpMaterial3LayoutView >> doHeart [

	self setMainPage: 'Heart'
]

{ #category : #rendering }
CpMaterial3LayoutView >> doSpade [

	self setMainPage: 'Spade'
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

{ #category : #'rendering - bottomAppBar' }
CpMaterial3LayoutView >> renderBottomeAppBar [

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

{ #category : #'rendering - topAppBar' }
CpMaterial3LayoutView >> renderHeadline: aString [

	aString
		ifNotNil: [
			self
				replaceAllChildrenWith: (aString asString inHtmlTag: #span)
				atSlotNamed: #headline ]
		ifNil: [ self removeChildrenAtSlotNamed: #headline ]
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

{ #category : #'rendering - topAppBar' }
CpMaterial3LayoutView >> renderLeadingAction: aString [

	aString
		ifNotNil: [ | drawer |
			drawer := self findLeftDrawer.
			self
				replaceAllChildrenWith: ((SlIconButton named: 'list')
					when: CpClickEvent basicPrimary send: #show to: drawer;
					yourself)
				atSlotNamed: #leadingAction ]
		ifNil: [ self removeChildrenAtSlotNamed: #leadingAction ]
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

{ #category : #rendering }
CpMaterial3LayoutView >> renderPage [

	self renderPage: currentPage
]

{ #category : #rendering }
CpMaterial3LayoutView >> renderPage: aPageName [
	| split |

	split := SlSplitPanel new
			customPropertyAt: 'divider-width' put: '24px';
			replaceAllChildrenWith: (aPageName inHtmlTag: #span) atSlotNamed: #'start';
			replaceAllChildrenWith: (aPageName inHtmlTag: #span) atSlotNamed: #'end';
			replaceAllChildrenWith: (SlIcon named: 'grip-vertical') atSlotNamed: #'divider';
			yourself.

	self
		replaceAllChildrenWith: split
		atSlotNamed: #'slx-pane-content'
]

{ #category : #'rendering - topAppBar' }
CpMaterial3LayoutView >> renderTopAppBar [
	| trailing |

	self
		renderLeadingAction: self leadingAction;
		renderHeadline: self headline;
		yourself.
	trailing := self trailingActions.
	trailing size >= 1 ifTrue: [ self renderTrailingIcon1: trailing first ].
	trailing size >= 2 ifTrue: [ self renderTrailingIcon2: trailing second ].
	trailing size >= 3 ifTrue: [ self renderTrailingIcon3: trailing third ].

]

{ #category : #'rendering - topAppBar' }
CpMaterial3LayoutView >> renderTrailingIcon1: aString [

	self renderTrailingIcon: aString at: #trailingIcon1
]

{ #category : #'rendering - topAppBar' }
CpMaterial3LayoutView >> renderTrailingIcon2: aString [

	self renderTrailingIcon: aString at: #trailingIcon2
]

{ #category : #'rendering - topAppBar' }
CpMaterial3LayoutView >> renderTrailingIcon3: aString [

	self renderTrailingIcon: aString at: #trailingIcon3 
]

{ #category : #'rendering - topAppBar' }
CpMaterial3LayoutView >> renderTrailingIcon: aString at: slotName [

	aString
		ifNotNil: [
			self
				replaceAllChildrenWith: (SlIconButton named: aString)
				atSlotNamed: slotName ]
		ifNil: [ self removeChildrenAtSlotNamed: slotName ]
]

{ #category : #rendering }
CpMaterial3LayoutView >> setMainPage: aString [

	currentPage := aString.
	self renderPage

]

{ #category : #accessing }
CpMaterial3LayoutView >> trailingActions [

	^ trailingActions
]

{ #category : #accessing }
CpMaterial3LayoutView >> trailingActions: anObject [

	trailingActions := anObject
]
