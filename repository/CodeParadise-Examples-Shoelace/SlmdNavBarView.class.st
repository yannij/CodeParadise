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
.smd-navBar-footer {
  background: var(--sl-color-primary-200);
}

.smd-navBar {
  z-index: 10;
  display: flex;
  justify-content: space-between;
  flex-flow: row nowrap;
  padding: 12px;
}
'
]

{ #category : #'web resources' }
SlmdNavBarView class >> template [

	<webResource: #html>

	^ '
<div id="container" class="smd-navBar-footer">
  <div class="smd-navBar">
    <slot name="navBar"></slot>
  </div>
</div>
'
]

{ #category : #'as yet unclassified' }
SlmdNavBarView >> navSetUp [

	navItems ifNotNil: [
		navItems withIndexDo: [ :eachItem :index | | navItem |
			index <= 5 ifTrue: [
				navItem := self navbarBuildItem: (navActions at: eachItem).
				self appendChild: navItem atSlotNamed: 'navBar' ] ] ].

]

{ #category : #'as yet unclassified' }
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
