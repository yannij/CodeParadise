Class {
	#name : #SlmdNavBarView,
	#superclass : #SlmdNavView,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #'web resources' }
SlmdNavBarView class >> globalStyle [
	<webResource: #css>

	^ '
.smd-navbar-font {
  line-height: var(--sl-line-height-normal);
  font-size: var(--sl-font-size-small);
  font-weight: var(--sl-font-weight-normal);
}

.smd-navbar-item {
  flex-basis: max-content;
  display: flex;
  padding: 0 4px;
  border-radius: 20px;
  height: 40px;
  background: var(--sl-color-primary-100);
}

.smd-navbar-icon {
  padding-top: 0;
  padding-left: 4px;
  font-size: 24px;
}

.smd-navbar-labelText {
  padding-top: 8px;
  padding-left: 4px;
  padding-right: 16px;
}
'
]

{ #category : #'web resources' }
SlmdNavBarView class >> style [

	<webResource: #css>

	^ '
.smd-navBar {
  z-index: 10;
  display: flex;
  justify-content: space-between;
  flex-flow: row nowrap;
  padding: 12px 4px;
  background: var(--sl-color-primary-200);
}
'
]

{ #category : #'web resources' }
SlmdNavBarView class >> template [

	<webResource: #html>

	^ '
<div id="container" class="smd-navBar">
  <slot name="navBar"></slot>
</div>
'
]

{ #category : #rendering }
SlmdNavBarView >> dropdownMenu: actionList [
	| menu dropdown |

	menu := SlMenu new.
	actionList do: [ :each |
		menu appendChild: (SlMenuItem new
			when: CpClickEvent basicPrimary do: [ self executeNavAction: each ] for: self;
			prefix: (SlIcon named: (each at: #iconName));
			textContent: (each at: #iconLabel);
			yourself) ].

	dropdown := SlDropdown new
		replaceAllChildrenWith: (SlIconButton named: 'three-dots') atSlotNamed: #trigger;
		appendChild: menu;
		yourself.

	^ dropdown

]

{ #category : #rendering }
SlmdNavBarView >> navInitialize [
	| list items navList overflowList |

	navItems ifNil: [ ^ self ].

	list := self navActions.
	items := navItems collect: [ :each | list at: each ].

	items size <= 4 ifTrue: [
		items withIndexDo: [ :each :index |
			self appendChild: (self navbarBuildItem: each) atSlotNamed: 'navBar' ].
		^ self ].

	navList := items copyFrom: 1 to: 3.
	navList withIndexDo: [ :each :index |
		self appendChild: (self navbarBuildItem: each) atSlotNamed: 'navBar' ].

	overflowList := items copyFrom: 4 to: items size.
	self appendChild: (self dropdownMenu: overflowList) atSlotNamed: 'navBar'.

]

{ #category : #rendering }
SlmdNavBarView >> navbarBuildItem: aNavAction [
	| iconName |

	iconName := aNavAction at: #iconName.

	^ #div asHtmlTag
		addClass: 'smd-navbar-item';
		addClass: 'smd-navbar-font';
		when: CpClickEvent basicPrimary do: [ self executeNavAction: aNavAction ] for: self;
		appendChild: ((SlIconButton named: iconName) addClass: 'smd-navbar-icon'; yourself);
		appendChild: (#div asHtmlTag
			addClass: 'smd-navbar-labelText';
			textContent: (aNavAction at: #iconLabel);
			yourself);
		yourself
]
