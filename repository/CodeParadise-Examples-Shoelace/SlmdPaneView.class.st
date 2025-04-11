Class {
	#name : #SlmdPaneView,
	#superclass : #CpView,
	#category : #'CodeParadise-Examples-Shoelace-MaterialDesign3App'
}

{ #category : #'web resources' }
SlmdPaneView class >> style [

	<webResource: #css>

	^ '
.smd-pane-content {
  border-radius: 16px;
  background: var(--sl-color-primary-50);
}
'
]

{ #category : #'web resources' }
SlmdPaneView class >> template [

	<webResource: #html>

	^ '
<div id="container" class="smd-pane-content">
  <slot name="content"></slot>
</div>
'
]

{ #category : #rendering }
SlmdPaneView >> renderId: paneId content: aString [

	self
		replaceAllChildrenWith: (#div asHtmlTag
			id: paneId;
			addClass: 'smd-pane';
			appendChild: (aString inHtmlTag: #span);
			yourself)
		atSlotNamed: 'content'.

]
