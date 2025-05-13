Class {
	#name : #SlmdNavView,
	#superclass : #SlmdView,
	#instVars : [
		'navActions',
		'navItems',
		'navType',
		'isModal',
		'drawer'
	],
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #'web resources' }
SlmdNavView class >> globalStyle [
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
  line-height: 16px;
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
SlmdNavView class >> template [
	<webResource: #html>

	^ '
<nav id="container">
  <slot name="navRegion"></slot>
</nav>
'
]

{ #category : #nav }
SlmdNavView >> addNavActionId: id key: key value: value [
	| item |

	(navActions includesKey: id) ifFalse: [
		navActions at: id put: Dictionary new ].
	item := navActions at: id.
	item at: key put: value
]

{ #category : #nav }
SlmdNavView >> addNavItem: aNavActionId [

	self navItems add: aNavActionId asSymbol
]

{ #category : #'nav - drawer' }
SlmdNavView >> buildNavdrawerItem: aNavAction [
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
SlmdNavView >> buildNavrailItem: aNavAction [
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

{ #category : #accessing }
SlmdNavView >> drawer [

	^ drawer
]

{ #category : #accessing }
SlmdNavView >> drawer: anObject [

	drawer := anObject
]

{ #category : #'nav - drawer' }
SlmdNavView >> initialize [

	super initialize.

	navActions := Dictionary new.
	navItems := OrderedCollection new.

]

{ #category : #accessing }
SlmdNavView >> isModal [

	^ isModal
]

{ #category : #accessing }
SlmdNavView >> isModal: anObject [

	isModal := anObject
]

{ #category : #accessing }
SlmdNavView >> navActions [

	^ navActions
]

{ #category : #accessing }
SlmdNavView >> navActions: anObject [

	navActions := anObject
]

{ #category : #nav }
SlmdNavView >> navContentBuild [

	self navTypeIsDrawer ifTrue: [
		^ self navdrawerBuild ].

	^ self navrailBuild
]

{ #category : #accessing }
SlmdNavView >> navItems [

	^ navItems
]

{ #category : #accessing }
SlmdNavView >> navItems: anObject [

	navItems := anObject
]

{ #category : #nav }
SlmdNavView >> navModalPaneBuild [

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
SlmdNavView >> navModalPaneContentFind [

	^ self modalNavElementOrNil firstDescendantMatching: '#smdNavModalPaneContent'

]

{ #category : #nav }
SlmdNavView >> navModalPaneSetUp [
	"Add modal nav element as sibling of layout's navRegion"

	"SlmdLayoutView first navRegionFind parent"
	self modalDivFind
		appendChild: self navModalPaneBuild
]

{ #category : #nav }
SlmdNavView >> navSetUp [
	| el |

	el := self navModalPaneContentFind.
	el replaceAllChildrenWith: self navContentBuild.

	self
		replaceAllChildrenWith: self navContentBuild
		atSlotNamed: 'navRegion'.

]

{ #category : #accessing }
SlmdNavView >> navType [

	^ navType
]

{ #category : #accessing }
SlmdNavView >> navType: anObject [

	navType := anObject
]

{ #category : #nav }
SlmdNavView >> navTypeIsBar [

	^ self navType = #bar
]

{ #category : #nav }
SlmdNavView >> navTypeIsDrawer [

	^ self navType = #drawer
]

{ #category : #nav }
SlmdNavView >> navTypeIsRail [

	^ self navType = #rail
]

{ #category : #nav }
SlmdNavView >> navTypeWidth [

	self navTypeIsRail ifTrue: [ ^ 80 ].
	self navTypeIsDrawer ifTrue: [ ^ 360 ].
	self navTypeIsBar ifTrue: [ ^ 0 ].
	^ 80
]

{ #category : #'nav - drawer' }
SlmdNavView >> navdrawerBuild [
	| element |

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

{ #category : #'nav - rail' }
SlmdNavView >> navrailBuild [
	| element |

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
