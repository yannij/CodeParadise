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
.smd-hidden {
  display: none;
}

.smd-pane-layout {
  overflow-y: auto;
}

.smd-pane {
  flex: 100%;
  display: flex;  
  flex-direction: column;
  padding: 8px;
  margin: 0;
  text-align: left;
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
      <div id="smdTopAppBar">
        <slot name="topAppBar"></slot>
      </div>
      <slot name="pane1"></slot>
    </div>
    <div class="smd-pane">
      <slot name="pane2"></slot>
    </div>
  </div>
  <div id="smdTwoPaneLayout">
    <sl-split-panel
        id="smdBodySplitPanel" class="smd-body-split-panel"
        primary="start" style="--min: 300px; --divider-width: 24px;">
      <sl-icon slot="divider" name="grip-vertical"></sl-icon>
      <div slot="start">
        <div class="smd-pane">
          <div id="smdTopAppBarP2">
            <slot name="topAppBarP2"></slot>
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

{ #category : #body }
SlmdPaneLayoutView >> bodySetUp [

	SlmdLayoutView first layoutAdaptToWidth.

]

{ #category : #actions }
SlmdPaneLayoutView >> pane1WidthSet: anInteger [
	| split |

	split := self findByIdInShadowDom: 'smdBodySplitPanel'.
	split ifNotNil: [
		split attributeAt: 'position-in-pixels' put: anInteger printString ].

]

{ #category : #topAppBar }
SlmdPaneLayoutView >> topAppBarDisplay: aBoolean [

	self shadowElementId: 'smdTopAppBar' show: aBoolean.
	self shadowElementId: 'smdTopAppBarP2' show: aBoolean.

]

{ #category : #topAppBar }
SlmdPaneLayoutView >> useOnePaneLayout [

	"self traceCr: 'View: useOnePaneLayout'."
	"self moveChildrenFromSlot: 'topAppBarP2' to: 'topAppBar'.
	self moveChildrenFromSlot: 'pane1P2' to: 'pane1'.
	self moveChildrenFromSlot: 'pane2P2' to: 'pane2'."
	self shadowElementId: 'smdTwoPaneLayout' show: false.
	self shadowElementId: 'smdOnePaneLayout' show: true.

]

{ #category : #topAppBar }
SlmdPaneLayoutView >> useTwoPaneLayout [

	"self traceCr: 'View: useTwoPaneLayout'."
	"self moveChildrenFromSlot: 'topAppBar' to: 'topAppBarP2'.
	self moveChildrenFromSlot: 'pane1' to: 'pane1P2'.
	self moveChildrenFromSlot: 'pane2' to: 'pane2P2'."
	self shadowElementId: 'smdOnePaneLayout' show: false.
	self shadowElementId: 'smdTwoPaneLayout' show: true.

]
