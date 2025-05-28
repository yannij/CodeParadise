Class {
	#name : #SlmdPaneView,
	#superclass : #SlmdLayoutComponentView,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #'web resources' }
SlmdPaneView class >> style [

	<webResource: #css>

	^ '
.smd-pane-content {
  padding: 8px;
  border-radius: 16px;
  background: var(--sl-color-primary-50);
}
'
]

{ #category : #'web resources' }
SlmdPaneView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <slot name="content"></slot>
</div>
'
]

{ #category : #rendering }
SlmdPaneView >> renderId: paneId content: aString [

	self
		replaceAllChildrenWith: (#div asHtmlTag
			"id: paneId;"
			addClass: 'smd-pane';
			appendChild: (aString inHtmlTag: #span);
			yourself)
		atSlotNamed: 'content'.

]
