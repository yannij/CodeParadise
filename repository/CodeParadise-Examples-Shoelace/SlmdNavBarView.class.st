Class {
	#name : #SlmdNavBarView,
	#superclass : #SlmdView,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #'web resources' }
SlmdNavBarView class >> style [

	<webResource: #css>

	^ '
.smd-navBar-footer {
  flex: 0 0 72px;
  background: var(--sl-color-primary-200);
}

.smd-navBar {
  z-index: 10;
  display: flex;
  flex-flow: row wrap;
  padding: 12px 16px 12px 4px;
}

.smd-navBar-button {
  height: 48px;
  width: 48px;
  font-size: 24px;
}
'
]

{ #category : #'web resources' }
SlmdNavBarView class >> template [

	<webResource: #html>

	^ '
<div id="container" class="smd-navBar-footer">
  <div class="smd-navBar">
    <div class="smd-navBar-button">
      <slot name="item1"></slot>
    </div>
    <div class="smd-navBar-button">
      <slot name="item2"></slot>
    </div>
    <div class="smd-navBar-button">
      <slot name="item3"></slot>
    </div>
  </div>
</div>
'
]

{ #category : #bottomAppBar }
SlmdNavBarView >> buildIconButton: iconName class: cssClass [

	^ (CpHtmlElement newWithTag: #div)
		addClass: cssClass;
		appendChild: (SlIconButton named: iconName);
		yourself
]

{ #category : #rendering }
SlmdNavBarView >> renderIcon: iconName at: slotName with: cssClass [

	self
		replaceAllChildrenWith: (self buildIconButton: iconName class: cssClass)
		atSlotNamed: slotName.

]
