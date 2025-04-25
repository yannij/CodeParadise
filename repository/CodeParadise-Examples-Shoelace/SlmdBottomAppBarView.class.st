Class {
	#name : #SlmdBottomAppBarView,
	#superclass : #SlmdView,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #'web resources' }
SlmdBottomAppBarView class >> style [

	<webResource: #css>

	^ '
.smd-footer {
  flex: 0 0 72px;
  background: var(--sl-color-primary-200);
}

.smd-bottomAppBar {
  z-index: 10;
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
SlmdBottomAppBarView class >> template [

	<webResource: #html>

	^ '
<div id="container" class="smd-footer">
  <div class="smd-bottomAppBar">
    <div class="smd-bottomAppBar-button">
      <slot name="item1"></slot>
    </div>
    <div class="smd-bottomAppBar-button">
      <slot name="item2"></slot>
    </div>
    <div class="smd-bottomAppBar-button">
      <slot name="item3"></slot>
    </div>
    <div class="smd-bottomAppBar-fab">
      <slot name="fab"></slot>
    </div>
  </div>
</div>
'
]

{ #category : #bottomAppBar }
SlmdBottomAppBarView >> buildIconButton: iconName class: cssClass [

	^ (CpHtmlElement newWithTag: #div)
		addClass: cssClass;
		appendChild: (SlIconButton named: iconName);
		yourself
]

{ #category : #rendering }
SlmdBottomAppBarView >> renderIcon: iconName at: slotName with: cssClass [

	self
		replaceAllChildrenWith: (self buildIconButton: iconName class: cssClass)
		atSlotNamed: slotName.

]
