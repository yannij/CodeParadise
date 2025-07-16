Class {
	#name : #SlmdPaneContentView,
	#superclass : #SlmdLayoutComponentView,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMD3Components'
}

{ #category : #'web resources' }
SlmdPaneContentView class >> template [

	<webResource: #html>

	^ '
<div id="container">
  <div class="smd-pane-content" style="padding: 8px">
    <slot name="content"></slot>
  </div>
</div>
'
]

{ #category : #rendering }
SlmdPaneContentView >> renderContent: aString [

	self replaceAllChildrenWith: (aString inHtmlTag: #span) atSlotNamed: 'content'.

]
