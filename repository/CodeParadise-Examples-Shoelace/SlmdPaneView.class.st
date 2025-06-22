Class {
	#name : #SlmdPaneView,
	#superclass : #SlmdLayoutComponentView,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Components'
}

{ #category : #'web resources' }
SlmdPaneView class >> style [

	<webResource: #css>

	^ '
.smd-pane-content {
  padding: 8px;
  border-radius: 16px;
  background: var(--sl-color-primary-50);
  overflow-x: auto;
  overflow-y: auto;
}
'
]

{ #category : #'web resources' }
SlmdPaneView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <div class="smdAppBar">
    <slot name="appBar"></slot>
  </div>
  <div class="smd-pane-content">
    <slot name="paneContent"></slot>
  </div>
</div>
'
]

{ #category : #accessing }
SlmdPaneView >> paneContentView [

	^ self firstChildAtSlotNamed: 'paneContent'
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
