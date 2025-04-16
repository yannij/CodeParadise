Class {
	#name : #SlmdTwoPaneView,
	#superclass : #SlmdPaneLayoutView,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #'class initialization' }
SlmdTwoPaneView class >> beLoaded [

	SlIcon beLoaded.
	SlSplitPanel beLoaded
]

{ #category : #'web resources' }
SlmdTwoPaneView class >> template [

	<webResource: #html>

	^ '
  <div id="smdPaneLayout" class="smd-pane-layout">
    <sl-split-panel
        id="smdBodySplitPanel" class="smd-body-split-panel"
        primary="start" style="--min: 300px; --divider-width: 24px;">
      <sl-icon slot="divider" name="grip-vertical"></sl-icon>
      <div slot="start">
        <div id="smdPane1" class="smd-pane">
          <div id="smdTopAppBar">
            <slot name="topAppBar"></slot>
          </div>
          <slot name="pane1"></slot>
        </div>
      </div>
      <div slot="end">
        <div id="smdPane2" class="smd-pane">
          <slot name="pane2"></slot>
        </div>
      </div>
    </sl-split-panel>
  </div>
'
]

{ #category : #actions }
SlmdTwoPaneView >> pane1WidthSet: anInteger [
	| split |

	split := self findByIdInShadowDom: 'smdBodySplitPanel'.
	split attributeAt: 'position-in-pixels' put: anInteger printString.

]
