Class {
	#name : #SlmdPaneLayoutView,
	#superclass : #SlmdView,
	#category : #'CodeParadise-Examples-Shoelace-ShoelaceMaterialComponents'
}

{ #category : #'class initialization' }
SlmdPaneLayoutView class >> beLoaded [

	SlIcon beLoaded.
	SlSplitPanel beLoaded
]

{ #category : #'web resources' }
SlmdPaneLayoutView class >> style [

	<webResource: #css>
	^ '
.smd-pane-layout {
  height: 100%;
  overflow-y: auto;
}

.smd-pane {
  flex: 100%;
  display: flex;  
  flex-direction: column;
  padding: 8px;
  margin: 0;
}

.smd-pane-content {
  overflow-x: auto;
  overflow-y: auto;
}

.smd-body-split-panel {
  height: 100%;
}

.smd-pane-layout sl-split-panel::part(divider) {
  background-color: var(--sl-color-primary-50);
}
'
]

{ #category : #'web resources' }
SlmdPaneLayoutView class >> template [

	<webResource: #html>
	^ '
<div id="container" class="smd-pane-layout">
  <div id="smdOnePaneLayout">
    <div class="smd-pane">
      <div id="smdAppBar">
        <slot name="appBar"></slot>
      </div>
      <div class="smd-pane-content">
        <slot name="pane1"></slot>
      </div>
    </div>
    <div class="smd-pane">
      <div class="smd-pane-content">
        <slot name="pane2"></slot>
      </div>
    </div>
  </div>
  <div id="smdTwoPaneLayout">
    <sl-split-panel
        id="smdBodySplitPanel" class="smd-body-split-panel"
        primary="start" style="--min: 300px; --divider-width: 24px;">
      <sl-icon slot="divider" name="grip-vertical"></sl-icon>
      <div slot="start">
        <div class="smd-pane">
          <div id="smdAppBarP2">
            <slot name="appBarP2"></slot>
          </div>
          <slot name="pane1P2"></slot>
        </div>
      </div>
      <div slot="end">
        <div class="smd-pane">
          <slot name="pane2P2"></slot>
        </div>
      </div>
    </sl-split-panel>
  </div>
</div>
'
]

{ #category : #topAppBar }
SlmdPaneLayoutView >> appBarDisplay: aBoolean [

	self shadowElementId: 'smdAppBar' show: aBoolean.
	self shadowElementId: 'smdAppBarP2' show: aBoolean.

]

{ #category : #actions }
SlmdPaneLayoutView >> pane1WidthSet: anInteger [
	| split |

	split := self findByIdInShadowDom: 'smdBodySplitPanel'.
	split ifNotNil: [
		split attributeAt: 'position-in-pixels' put: anInteger printString ].

]

{ #category : #topAppBar }
SlmdPaneLayoutView >> useOnePaneLayout [

	"self traceCr: 'View: useOnePaneLayout'."
	self shadowElementId: 'smdTwoPaneLayout' show: false.
	self shadowElementId: 'smdOnePaneLayout' show: true.

]

{ #category : #topAppBar }
SlmdPaneLayoutView >> useTwoPaneLayout [

	"self traceCr: 'View: useTwoPaneLayout'."
	self shadowElementId: 'smdOnePaneLayout' show: false.
	self shadowElementId: 'smdTwoPaneLayout' show: true.

]
