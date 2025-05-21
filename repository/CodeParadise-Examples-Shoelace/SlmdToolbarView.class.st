Class {
	#name : #SlmdToolbarView,
	#superclass : #SlmdLayoutComponentView,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #'web resources' }
SlmdToolbarView class >> style [

	<webResource: #css>

	^ '
.smd-toolbar-footer {
  background: var(--sl-color-primary-200);
}

.smd-toolbar {
  z-index: 10;
  display: flex;
  flex-flow: row wrap;
  padding: 12px 16px 12px 4px;
}

.smd-toolbar-button {
  height: 60px;
  width: 48px;
  font-size: 24px;
}

.smd-toolbar-fab {
  margin-left: auto;
  height: 48px;
  width: 48px;
  font-size: 24px;
  background: var(--sl-color-primary-300);
}
'
]

{ #category : #'web resources' }
SlmdToolbarView class >> template [

	<webResource: #html>

	^ '
<div id="container" class="smd-toolbar-footer">
  <div class="smd-toolbar">
    <div class="smd-toolbar-button">
      <slot name="item1"></slot>
    </div>
    <div class="smd-toolbar-button">
      <slot name="item2"></slot>
    </div>
    <div class="smd-toolbar-button">
      <slot name="item3"></slot>
    </div>
    <div class="smd-toolbar-fab">
      <slot name="fab"></slot>
    </div>
  </div>
</div>
'
]

{ #category : #'as yet unclassified' }
SlmdToolbarView >> buildIconButton: iconName class: cssClass [

	^ (CpHtmlElement newWithTag: #div)
		addClass: cssClass;
		appendChild: (SlIconButton named: iconName);
		yourself
]

{ #category : #'as yet unclassified' }
SlmdToolbarView >> renderIcon: iconName at: slotName with: cssClass [

	self
		replaceAllChildrenWith: (self buildIconButton: iconName class: cssClass)
		atSlotNamed: slotName.

]
