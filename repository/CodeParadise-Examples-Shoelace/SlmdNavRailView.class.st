Class {
	#name : #SlmdNavRailView,
	#superclass : #SlmdNavView,
	#instVars : [
		'isModal',
		'drawer',
		'isExpanded'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #'class initialization' }
SlmdNavRailView class >> beLoaded [

	SlDrawer beLoaded
]

{ #category : #'web resources' }
SlmdNavRailView class >> globalStyle [
	<webResource: #css>

	^ '
.smd-navRegion {
  flex: 0 0 96px;
  height: 100%;
  padding: 0;
  margin: 0;
}
'
, self styleNav

]

{ #category : #'web resources' }
SlmdNavRailView class >> styleNav [
	"These style definitions should be added to the layout component style
	to be visible the modal nav content.
	They must also be included in the navrail component style."

	<webResource: #css>

	^ '
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
  width: 96px;
  padding-top: 12px;
}

.smd-navrail-icon {
  font-size: 24px;
  padding-left: 28px;
}

.smd-navrail-labelText {
  padding: 0;
  line-height: 16px;
  font-size: var(--sl-font-size-x-small);
  align-items: center;
  text-align: center;
  overflow-x: clip;
}

.smd-navrailx {
  height: 100%;
  padding-left: 20px;
  margin: 0;
  background: var(--sl-color-primary-100);
  flow-direction: row;
}

.smd-navrailx::part(panel) {
  background: var(--sl-color-primary-100);
}

.smd-navrailx-item {
  display: flex;
  border-radius: 28px;
  height: 56px;
  width: 220px;
  background: var(--sl-color-primary-100);
  align-items: center;
}

.smd-navrailx-icon {
  padding-left: 8px;
  font-size: 24px;
}

.smd-navrailx-labelText {
  padding-left: 16px;
  font-size: 16px;
}
'
]

{ #category : #'web resources' }
SlmdNavRailView class >> template [
	<webResource: #html>

	^ '
<nav id="container">
  <slot name="navRegion"></slot>
</nav>
'
]

{ #category : #accessing }
SlmdNavRailView >> drawer [

	^ drawer
]

{ #category : #accessing }
SlmdNavRailView >> drawer: anObject [

	drawer := anObject
]

{ #category : #initialize }
SlmdNavRailView >> initialize [

	super initialize.

	isExpanded := false.

]

{ #category : #accessing }
SlmdNavRailView >> isExpanded [

	^ isExpanded
]

{ #category : #accessing }
SlmdNavRailView >> isExpanded: anObject [

	isExpanded := anObject
]

{ #category : #accessing }
SlmdNavRailView >> isModal [

	^ isModal
]

{ #category : #accessing }
SlmdNavRailView >> isModal: anObject [

	isModal := anObject
]

{ #category : #nav }
SlmdNavRailView >> navContentBuild [

	self isExpanded ifTrue: [
		^ self navrailExpandedBuild ].

	^ self navrailNarrowBuild
]

{ #category : #nav }
SlmdNavRailView >> navModalPaneBuild [

	drawer := SlDrawer new
		id: 'smdNavModalPane';
		placement: 'left';
		beNoHeader;
		customPropertyAt: 'size' put: self navRailWidth printString, 'px';
		customPropertyAt: 'body-spacing' put: '0';
		customPropertyAt: 'header-spacing' put: '0';
		customPropertyAt: 'footer-spacing' put: '0';
		yourself.
	
	"drawer footer: (
		(SlButton label: 'Close')
			when: CpClickEvent basicPrimary send: #hide to: drawer;
			yourself)."

	^ drawer
]

{ #category : #nav }
SlmdNavRailView >> navModalPaneSetUp [
	"Add modal nav element as sibling of layout's navRegion"

	"SlmdLayoutView first navRegionFind parent"
	self modalDivFind
		appendChild: self navModalPaneBuild
]

{ #category : #nav }
SlmdNavRailView >> navRailWidth [

	^ self isExpanded ifTrue: [ 220 ] ifFalse: [ 96 ]
]

{ #category : #nav }
SlmdNavRailView >> navSetUp [

	self modalNavElementOrNil
		replaceAllChildrenWith: self navContentBuild
		atSlotNamed: nil.

	self
		replaceAllChildrenWith: self navContentBuild
		atSlotNamed: 'navRegion'.

]

{ #category : #nav }
SlmdNavRailView >> navrailExpandedBuild [
	| element |

	element := #div asHtmlTag
		addClass: 'smd-navrailx';
		"appendChild: (#div asHtmlTag
			addClass: 'smd-navdrawer-headline';
			addClass: 'smd-nav-font';
			textContent: 'Headline';
			yourself);"
		yourself.
	navItems ifNotNil: [
		navItems do: [ :eachItem | | navItem |
			navItem := self navrailExpandedBuildItem: (navActions at: eachItem).
			navItem when: CpClickEvent basicPrimary send: #hide to: drawer.
			element appendChild: navItem ] ].

	^ #nav asHtmlTag
		styleAt: 'height' put: '100%';
		"styleAt: 'overflow-y' put: 'auto';"
		appendChild: element;
		yourself
]

{ #category : #nav }
SlmdNavRailView >> navrailExpandedBuildItem: aNavAction [
	| iconName arg1 |

	iconName := aNavAction at: #iconName.
	arg1 := aNavAction at: #arg1.

	^ #div asHtmlTag
		addClass: 'smd-navrailx-item';
		addClass: 'smd-nav-font';
		when: CpClickEvent basicPrimary do: [ self navigateTo: arg1 ] for: self;
		appendChild: ((SlIconButton named: iconName) addClass: 'smd-navrailx-icon'; yourself);
		appendChild: (#div asHtmlTag
			addClass: 'smd-navrailx-labelText';
			textContent: (aNavAction at: #iconLabel);
			yourself);
		yourself
]

{ #category : #nav }
SlmdNavRailView >> navrailNarrowBuild [
	| element |

	element := #div asHtmlTag addClass: 'smd-navrail'; yourself.
	navItems ifNotNil: [
		navItems do: [ :eachItem | | navItem |
			navItem := self navrailNarrowBuildItem: (navActions at: eachItem asSymbol).
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

{ #category : #nav }
SlmdNavRailView >> navrailNarrowBuildItem: aNavAction [
	| iconName arg1 |

	iconName := aNavAction at: #iconName.
	arg1 := aNavAction at: #arg1.

	^ #div asHtmlTag
		addClass: 'smd-navrail-item';
		when: CpClickEvent basicPrimary do: [ self navigateTo: arg1 ] for: self;
		appendChild: (
			#div asHtmlTag
				addClass: 'smd-navrail-icon';
				appendChild: (SlIconButton named: iconName);
				yourself);
		appendChild: (
			#div asHtmlTag
				addClass: 'smd-navrail-labelText';
				textContent: (aNavAction at: #iconLabel);
				yourself);
		yourself
]
