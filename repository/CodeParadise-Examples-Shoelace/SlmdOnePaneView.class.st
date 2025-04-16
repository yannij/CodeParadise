Class {
	#name : #SlmdOnePaneView,
	#superclass : #SlmdPaneLayoutView,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #'web resources' }
SlmdOnePaneView class >> template [

	<webResource: #html>

	^ '
  <div id="smdPaneLayout" class="smd-pane-layout">
    <div id="smdPane1" class="smd-pane">
      <div id="smdTopAppBar">
        <slot name="topAppBar"></slot>
      </div>
      <slot name="pane1"></slot>
    </div>
    <div id="smdPane2" class="smd-pane">
      <slot name="pane2"></slot>
    </div>
  </div>
'
]
